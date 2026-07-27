<?php
/**
 * KotnikRP character bridge for MyBB 1.8.
 *
 * Install this file in the MyBB document root and keep the database
 * configuration outside public_html. The bridge copies only MyBB's existing
 * password hash and salt; it never receives or stores a plain-text password.
 */

define('IN_MYBB', 1);
require_once __DIR__ . '/global.php';

if (empty($mybb->user['uid'])) {
    redirect(
        'member.php?action=login&url=' . urlencode('kotnik.php'),
        'Aby utworzyć postać, zaloguj się najpierw na forum.'
    );
}

$bridgeConfigPath = getenv('KOTNIK_BRIDGE_CONFIG');
if (!$bridgeConfigPath) {
    // Keep the secret outside public_html but inside the domain's open_basedir.
    $bridgeConfigPath = dirname(__DIR__) . '/.kotnik-game-db.php';
}

if (!is_file($bridgeConfigPath)) {
    error('Most kont KotnikRP nie został jeszcze skonfigurowany.');
}

$gameDbConfig = require $bridgeConfigPath;
if (!is_array($gameDbConfig)) {
    error('Konfiguracja mostu kont KotnikRP jest nieprawidłowa.');
}

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try {
    $gameDb = new mysqli(
        $gameDbConfig['host'],
        $gameDbConfig['username'],
        $gameDbConfig['password'],
        $gameDbConfig['database'],
        isset($gameDbConfig['port']) ? (int) $gameDbConfig['port'] : 3306
    );
    $gameDb->set_charset('utf8mb4');
} catch (Throwable $exception) {
    error_log('Kotnik bridge connection error: ' . $exception->getMessage());
    error('Połączenie z bazą gry jest chwilowo niedostępne. Spróbuj ponownie później.');
}

function kotnik_sync_forum_user(mysqli $gameDb, array $forumUser): void
{
    $statement = $gameDb->prepare(
        'INSERT INTO mybb_users
            (uid, username, password, salt, usergroup, samp_warns, samp_kc)
         VALUES (?, ?, ?, ?, ?, 0, 0)
         ON DUPLICATE KEY UPDATE
            username = VALUES(username),
            password = VALUES(password),
            salt = VALUES(salt),
            usergroup = VALUES(usergroup)'
    );
    $uid = (int) $forumUser['uid'];
    $usergroup = (int) $forumUser['usergroup'];
    $statement->bind_param(
        'isssi',
        $uid,
        $forumUser['username'],
        $forumUser['password'],
        $forumUser['salt'],
        $usergroup
    );
    $statement->execute();
    $statement->close();
}

function kotnik_get_characters(mysqli $gameDb, int $forumUid): array
{
    $statement = $gameDb->prepare(
        'SELECT UID, Nick FROM mru_konta WHERE uid_forum = ? ORDER BY UID'
    );
    $statement->bind_param('i', $forumUid);
    $statement->execute();
    $result = $statement->get_result();
    $characters = $result->fetch_all(MYSQLI_ASSOC);
    $statement->close();
    return $characters;
}

try {
    kotnik_sync_forum_user($gameDb, $mybb->user);
} catch (Throwable $exception) {
    error_log('Kotnik bridge user sync error: ' . $exception->getMessage());
    error('Nie udało się zsynchronizować konta forum z grą.');
}

$message = '';
$messageClass = 'success';

if ($mybb->request_method === 'post') {
    verify_post_check($mybb->get_input('my_post_key'));
    $character = trim($mybb->get_input('character'));

    if (!preg_match('/^[A-Z][a-z]{1,11}_[A-Z][a-z]{1,11}$/', $character)) {
        $message = 'Nazwa musi mieć format Imie_Nazwisko, bez spacji i polskich znaków.';
        $messageClass = 'error';
    } else {
        try {
            $statement = $gameDb->prepare(
                'INSERT INTO mru_konta (Nick, `Key`, uid_forum) VALUES (?, \'\', ?)'
            );
            $forumUid = (int) $mybb->user['uid'];
            $statement->bind_param('si', $character, $forumUid);
            $statement->execute();
            $statement->close();
            $message = 'Postać została utworzona. Na serwer wejdź nickiem ' .
                htmlspecialchars_uni($character) . ' i użyj hasła z forum.';
        } catch (mysqli_sql_exception $exception) {
            if ((int) $exception->getCode() === 1062) {
                $message = 'Postać o tej nazwie już istnieje.';
                $messageClass = 'error';
            } else {
                error_log('Kotnik bridge character creation error: ' . $exception->getMessage());
                $message = 'Nie udało się utworzyć postaci. Spróbuj ponownie później.';
                $messageClass = 'error';
            }
        }
    }
}

$characters = kotnik_get_characters($gameDb, (int) $mybb->user['uid']);
$gameDb->close();

$characterItems = '';
foreach ($characters as $characterRow) {
    $characterItems .= '<li><strong>' .
        htmlspecialchars_uni($characterRow['Nick']) .
        '</strong> (UID ' . (int) $characterRow['UID'] . ')</li>';
}
if ($characterItems === '') {
    $characterItems = '<li>Nie masz jeszcze żadnej postaci.</li>';
}

$notice = '';
if ($message !== '') {
    $notice = '<div class="' . $messageClass . '">' . $message . '</div>';
}

add_breadcrumb('KotnikRP', 'kotnik.php');
$postKey = htmlspecialchars_uni($mybb->post_code);
$forumUsername = htmlspecialchars_uni($mybb->user['username']);

$page = '<html>
<head>
<title>KotnikRP — postacie</title>
{$headerinclude}
</head>
<body>
{$header}
<div class="wrapper">
    <div class="thead"><strong>KotnikRP — konto gry</strong></div>
    <div class="trow1" style="padding: 16px">
        <p>Konto forum: <strong>' . $forumUsername . '</strong></p>
        ' . $notice . '
        <h3>Twoje postacie</h3>
        <ul>' . $characterItems . '</ul>
        <h3>Utwórz postać</h3>
        <form method="post" action="kotnik.php">
            <input type="hidden" name="my_post_key" value="' . $postKey . '">
            <input type="text" name="character" maxlength="24"
                   pattern="[A-Z][a-z]{1,11}_[A-Z][a-z]{1,11}"
                   placeholder="Jan_Kowalski" required>
            <button type="submit" class="button">Utwórz postać</button>
        </form>
        <p><small>Następnie połącz się z serwerem pod utworzoną nazwą
        i wpisz to samo hasło, którego używasz na forum.</small></p>
    </div>
</div>
{$footer}
</body>
</html>';

output_page($page);
