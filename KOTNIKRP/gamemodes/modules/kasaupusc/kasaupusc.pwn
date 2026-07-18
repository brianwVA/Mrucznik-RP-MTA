#include <YSI_Coding\y_hooks>

#define MONEY_MODEL_ID 1212
#define MAX_DROPPED_MONEY 1000

new HasDroppedMoney[MAX_PLAYERS];
new MoneyObject[MAX_DROPPED_MONEY];
new MoneyAmount[MAX_DROPPED_MONEY];
new IsMoneyPickupValid[MAX_DROPPED_MONEY];
new Text3D:MoneyLabel[MAX_DROPPED_MONEY];
new TimeMoney[MAX_DROPPED_MONEY];

// Reset flagi po wejściu na serwer
hook OnPlayerConnect(playerid)
{
    HasDroppedMoney[playerid] = 0;
    return 1;
}

// -----------------------------
// PODNOSZENIE PIENIĘDZY
// -----------------------------
forward OnPickupMoney(playerid, pickupid);
public OnPickupMoney(playerid, pickupid)
{
    for (new i = 0; i < MAX_DROPPED_MONEY; i++)
    {
        if (IsMoneyPickupValid[i] && MoneyObject[i] == pickupid)
        {
            if(gettime()-TimeMoney[i] < 3) return 0;

			// Najpierw uniewaznij pickup. Kolejny callback nie moze wyplacic tej samej kwoty.
			new pickedAmount = MoneyAmount[i];
			IsMoneyPickupValid[i] = 0;
			MoneyAmount[i] = 0;

            DestroyDynamicPickup(MoneyObject[i]);
            if (MoneyLabel[i] != Text3D:INVALID_3DTEXT_ID)
            {
                DestroyDynamic3DTextLabel(MoneyLabel[i]);
                MoneyLabel[i] = Text3D:INVALID_3DTEXT_ID;
            }

            MoneyObject[i] = 0;
			DajKaseDone(playerid, pickedAmount);
			sendTipMessage(playerid, "Podniosles pieniadze z ziemi!");
            return 1;
        }
    }
    return 0;
}

// -----------------------------
// KOMENDA /UPUSC
// -----------------------------
YCMD:upusc(playerid, params[], help)
{
    if (HasDroppedMoney[playerid])
        return sendTipMessage(playerid, "Mozesz tylko raz upuscic pieniadze!");

    new amount;
    if (sscanf(params, "i", amount))
        return sendTipMessage(playerid, "Uzycie: /upusc [kwota]");
    if (amount <= 0)
        return sendTipMessage(playerid, "Nie mozesz upuscic takiej kwoty!");
	if(amount > 100000000)
		return sendTipMessage(playerid, "Jednorazowo mozesz upuscic najwyzej 100000000$.");
    if (kaska[playerid] < amount)
        return sendTipMessage(playerid, "Nie masz tyle pieniedzy!");

    // Znajdź wolny slot w tablicy
    new idx = -1;
    for (new i = 0; i < MAX_DROPPED_MONEY; i++)
    {
        if (!IsMoneyPickupValid[i])
        {
            idx = i;
            break;
        }
    }
    if (idx == -1)
        return sendTipMessage(playerid, "Na ziemi leży już zbyt dużo pieniędzy!");

    // Pozycja gracza
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);

    // Odejmij kasę i stwórz pickup
    ZabierzKaseDone(playerid, amount);
    MoneyAmount[idx] = amount;

    MoneyObject[idx] = CreateDynamicPickup(MONEY_MODEL_ID, 23, x, y, z, -1);
    IsMoneyPickupValid[idx] = 1;
    TimeMoney[idx] = gettime();

    new labelText[64];
    format(labelText, sizeof(labelText), "$%d", amount);
    MoneyLabel[idx] = CreateDynamic3DTextLabel(labelText, COLOR_YELLOW, x, y, z + 0.5, 10.0);

    new msg[64];
    format(msg, sizeof(msg), "Upusciles %d$ na ziemie!", amount);
    sendTipMessage(playerid, msg);

    HasDroppedMoney[playerid] = 1;
    return 1;
}
