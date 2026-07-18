///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
//////////////////////////////////////////////////////


static bool:AIRDEBUGMODE = true; //false

stock AirDrop_create()
{
    new id = Iter_Free(AirDrop_iterator);
    if(id == -1) return -100;

    new rng_pos_id = random(sizeof(drop_locations)), rng_item_id = random(sizeof(drop_items));
    AirDrop_data[id][ad_pos][0]         = drop_locations[rng_pos_id][0];
    AirDrop_data[id][ad_pos][1]         = drop_locations[rng_pos_id][1], 
    AirDrop_data[id][ad_pos][2]         = drop_locations[rng_pos_id][2],
    AirDrop_data[id][ad_vw]             = drop_locations[rng_pos_id][3],
    AirDrop_data[id][ad_int]            = drop_locations[rng_pos_id][4];

    AirDrop_data[id][ad_name]           = drop_items[rng_item_id][0];
    AirDrop_data[id][ad_itemtype]       = drop_items[rng_item_id][1];
    AirDrop_data[id][ad_item_values][0] = drop_items[rng_item_id][2];
    AirDrop_data[id][ad_item_values][1] = drop_items[rng_item_id][3];
    AirDrop_data[id][ad_item_values][2] = drop_items[rng_item_id][4];

    AirDrop_data[id][ad_pickup] = CreateDynamicPickup(drop_items[rng_item_id][5], 1, AirDrop_data[id][ad_item_values][0], AirDrop_data[id][ad_pos][0], AirDrop_data[id][ad_pos][1], AirDrop_data[id][ad_pos][2], AirDrop_data[id][ad_vw], AirDrop_data[id][ad_int]);
    UpdateDynamic3DTextLabelText(AirDrop_data[id][ad_label], -1, sprintf("{FF0000}%s", AirDrop_data[id][ad_name]));
    Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AirDrop_data[id][ad_label], E_STREAMER_X, AirDrop_data[id][ad_pos][0]);
    Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AirDrop_data[id][ad_label], E_STREAMER_Y, AirDrop_data[id][ad_pos][1]);
    Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AirDrop_data[id][ad_label], E_STREAMER_Z, AirDrop_data[id][ad_pos][2]);
    Streamer_SetIntData(STREAMER_TYPE_3D_TEXT_LABEL, AirDrop_data[id][ad_label], E_STREAMER_WORLD_ID, AirDrop_data[id][ad_vw]);


    if(AIRDEBUGMODE) printf("creating new airdrop, id %d", id);
    return id;
}

stock AirDrop_destroy(id = -1)
{
    if(id == -1) //destroy all
    {
        foreach(new i : AirDrop_iterator)
        {
            if(!AirDrop_exist(id))  continue;
            AirDrop_resetData(i);
        }
        return 2;
    }
    if(!AirDrop_exist(id)) 
        return -100;
    AirDrop_resetData(id);
    if(AIRDEBUGMODE) printf("destroyed airdrop id %d", id);
    return 1;
}

stock AirDrop_resetData(id)
{
    if(IsValidDynamic3DTextLabel(AirDrop_data[id][ad_label]))
    {
        UpdateDynamic3DTextLabelText(AirDrop_data[id][ad_label], -1, " ");
        Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AirDrop_data[id][ad_label], E_STREAMER_X, 0.0);
        Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AirDrop_data[id][ad_label], E_STREAMER_Y, 0.0);
        Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AirDrop_data[id][ad_label], E_STREAMER_Z, 0.0);
    }
    if(IsValidDynamicPickup(AirDrop_data[id][ad_pickup]))
        DestroyDynamicPickup(AirDrop_data[id][ad_pickup]);
    
    format(AirDrop_data[id][ad_name], 32, "");
    AirDrop_data[id][ad_itemtype] = 0;
    AirDrop_data[id][ad_item_values][0] = 0, AirDrop_data[id][ad_item_values][1] = 0;
    if(Iter_Contains(AirDrop_iterator, id))
        Iter_Remove(AirDrop_iterator, id);
    return 1;
}

stock AirDrop_exist(id)
{
    if(id < 0) return false;
    if(!Iter_Contains(AirDrop_iterator, id)) return false;
    return true;
}

YCMD:createlocation(playerid, params[])
{
    return 1;
}

YCMD:createaidrop(playerid, params[])
{
    AirDrop_create();

    return 1;
}
