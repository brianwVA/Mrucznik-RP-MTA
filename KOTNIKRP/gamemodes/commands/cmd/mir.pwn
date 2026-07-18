//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ mir ]------------------------------------------------//
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/


YCMD:mir(playerid, params[], help)
{
	if(IsAPolicja(playerid) || IsAFBI(playerid))  //RANGA
	{
        if(gettime() - GetPVarInt(playerid, "lastMiranda") < 20)
				return sendErrorMessage(playerid, "Nie możesz użyć tego tak szybko!");

		MirandaTalk(playerid, 0);
        SetPVarInt(playerid, "lastMiranda", gettime());
	}
	return 1;
}

new MirandaTalkStages[][128] = {
	"Masz prawo zachować milczenie. Wszystko co powiesz..",
	"..może zostać użyte przeciwko Tobie w sądzie.",
	"Masz prawo do adwokata. Jeżeli Cię na niego nie stać..",
	"..przysługuje Ci urzędnik z sądu.",
	"W każdej chwili możesz poprosić o obecność Adwokata..",
	"..bądź konsultację z nim. Czy zrozumiałeś swoje prawa?"
};

forward MirandaTalk(playerid, stage);
public MirandaTalk(playerid, stage)
{
	PlayerTalkIC(playerid, MirandaTalkStages[stage], "mówi", 8.0);

	if(stage < sizeof(MirandaTalkStages))
		SetTimerEx("MirandaTalk", 750, false, "ii", playerid, stage+1);
}
