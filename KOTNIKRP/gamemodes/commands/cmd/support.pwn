
YCMD:support(playerid, params[], help){
    if(IsPlayerConnected(playerid)){
        new string[128];
        new text[128];
        new supportid = -1;
        if(gPlayerLogged[playerid] == 1){
            if(sscanf(params, "s[128]", text)){
                sendTipMessage(playerid, "Użyj /support [pytanie]"); 
                return 1;
            }
            if(GetPVarInt(playerid, "active_ticket") != 0) return sendTipMessageEx(playerid, COLOR_GRAD2, "Twoje wcześniejsze zgłoszenie nadal jest aktywne. Poczekaj na odpowiedź!");
           
            if (strlen(text) <= 0){
                sendTipMessage(playerid, "Uzupełnij poprawnie zgłoszenie tekstem!");
                return 1;
            }
            for( new xid = 1; xid < MAX_SUPPORTS; xid++ ) {
                if( suppList[ xid ][ suppSend ] == false ) {
                    supportid = xid;
                    break;
                }
            }
            if( supportid == -1 ) return sendTipMessage( playerid, "Osiągnięto maksymalną liczbę zgłoszeń!" );
                
            suppList[ supportid ][ suppSend ] = true;
            suppList[ supportid ][ suppID ] = playerid;
        
            suppInfo[ playerid ][ suppSended ] = true;
            suppInfo[ playerid ][ suppAnswered ] = false;
                        
            strmid( suppList[ supportid ][ suppOwner ], GetNick( playerid ), 0, strlen( GetNick( playerid ) ), 32 );
            strmid( suppList[ supportid ][ suppQuestion ], text, 0, strlen( text ), 128 );
                        
            SendClientMessage(playerid, 0x008000AA, "Twoje zgłoszenie zostało wysłane do administracji, oczekuj na reakcję zanim napiszesz kolejne!");
            SetPVarInt(playerid, "active_ticket", playerid+1);
            format(string, sizeof(string), "[SUPPORT #%d] %s[%d]: {FFFFFF}%s", supportid, GetNick(playerid), playerid, text);
            SendMessageToAdminEx(string, COLOR_YELLOW, 1);
            //SetPVarInt(playerid, "wyreportowany", 15); //timer
		}
    }
    return 1;
}
