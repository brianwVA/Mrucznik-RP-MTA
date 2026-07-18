hook OnGameModeInit()
{
    for(new i = 0; i < AirDrop_maxvalue; i++)
    {
        AirDrop_data[i][ad_label] = CreateDynamic3DTextLabel(" ", -1, 0.0, 0.0, 0.0, 5.0);
    }
    return 1;
}