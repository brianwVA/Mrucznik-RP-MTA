# MyBB → KotnikRP account bridge

The bridge provides the registration flow expected by the original KotnikRP
gamemode without changing its MyBB password verification:

1. The player registers and signs in to MyBB.
2. The player opens `/kotnik.php`.
3. The bridge copies the existing MyBB UID, username, password hash and salt
   to the game database.
4. The player creates a character named `First_Last`.
5. `mru_konta.uid_forum` links the character to the MyBB user.
6. KotnikRP verifies the entered password using the original MyBB 1.8 hash.

The plain-text forum password is never sent to the bridge.

## Installation

- Upload `kotnik.php` to the MyBB document root.
- Create `/home/USER/domains/FORUM-DOMAIN/.kotnik-game-db.php` from the
  example. It remains outside `public_html` while staying inside the domain's
  PHP `open_basedir`.
- Set the configuration file mode to `0600`.
- Open `/kotnik.php` as a signed-in forum user.

Before deploying, back up both databases. The bridge uses prepared statements
and never modifies an existing `mru_konta` character.
