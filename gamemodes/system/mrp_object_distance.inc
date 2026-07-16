#if defined _mrp_object_distance_included
    #endinput
#endif
#define _mrp_object_distance_included

#define MRP_OBJECT_STREAM_DISTANCE (1000.0)
#define MRP_CA_OBJECT_LIMIT (100000)

stock MRP_ExpandObjectDistances(&Float:streamdistance, &Float:drawdistance)
{
    // Preserve explicit longer ranges, but lift every legacy/default range to
    // one kilometre. Streamer_SetVisibleItems keeps the active object pool at
    // the safe 999 PlayerObject limit in dense map areas.
    if(streamdistance < MRP_OBJECT_STREAM_DISTANCE)
    {
        streamdistance = MRP_OBJECT_STREAM_DISTANCE;
    }
    if(drawdistance < MRP_OBJECT_STREAM_DISTANCE)
    {
        drawdistance = MRP_OBJECT_STREAM_DISTANCE;
    }
}

stock MRP_DropDecorativeCACollision(objectid, modelid)
{
    // The stage billboard and neon tubes keep their normal MTA collision.
    // They do not need a duplicate ColAndreas body rebuilt after every move.
    if(modelid != 4988 && (modelid < 18647 || modelid > 18652))
    {
        return;
    }
    if(objectid < 0 || objectid >= MRP_CA_OBJECT_LIMIT)
    {
        return;
    }

    new collisionid = DynamicObjectIDToColID[objectid];
    if(collisionid < 0 || collisionid >= MRP_CA_OBJECT_LIMIT)
    {
        return;
    }

    CA_DestroyObject(collisionid);
    DynamicObjectIDToColID[objectid] = -1;
    ColIDToDynamicObjectID[collisionid] = -1;
}

// colandreas_streamer_integrate already aliases CreateDynamicObject to its
// collision-aware wrapper. Interpose once more so every later map include gets
// the expanded range without changing tens of thousands of source calls.
#undef CreateDynamicObject
stock MRP_CreateDynamicObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA:areaid = STREAMER_TAG_AREA:-1, priority = 0)
{
    MRP_ExpandObjectDistances(streamdistance, drawdistance);
    new objectid = CA_auto_CreateDynamicObject(modelid, x, y, z, rx, ry, rz, worldid, interiorid, playerid, streamdistance, drawdistance, areaid, priority);
    MRP_DropDecorativeCACollision(objectid, modelid);
    return objectid;
}
#define CreateDynamicObject MRP_CreateDynamicObject

// Vice City uses the dedicated collision-aware entry point directly.
stock MRP_CreateDynamicObjectVC(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = STREAMER_OBJECT_SD, Float:drawdistance = STREAMER_OBJECT_DD, STREAMER_TAG_AREA:areaid = STREAMER_TAG_AREA:-1, priority = 0)
{
    MRP_ExpandObjectDistances(streamdistance, drawdistance);
    new objectid = CA_auto_CreateDynamicObjectVC(modelid, x, y, z, rx, ry, rz, worldid, interiorid, playerid, streamdistance, drawdistance, areaid, priority);
    MRP_DropDecorativeCACollision(objectid, modelid);
    return objectid;
}
#define CA_auto_CreateDynamicObjectVC MRP_CreateDynamicObjectVC
