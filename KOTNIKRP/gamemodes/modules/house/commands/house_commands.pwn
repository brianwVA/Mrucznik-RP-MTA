#include "ahouse.pwn"
#include "house.pwn"
#include "buyhouse.pwn"
#include "sellhouse.pwn"

hook OnGameModeInit()
{
    SetTimer("command_ahouse", 200, false);
    SetTimer("command_buyhouse", 250, false);
    SetTimer("command_sellhouse", 300, false);
    //command_house();
}