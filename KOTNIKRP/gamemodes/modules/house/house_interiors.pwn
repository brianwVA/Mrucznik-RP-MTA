#define WALL_LEN       9.6376   // pozioma długość panelu (oś Y przy rotZ = 0)
#define WALL_HEIGHT    10.5015  // faktycczna wysokość modelu

stock CreateInteriorSquare(
    Float:ccx, Float:ccy, Float:ccz,      // środek pokoju (poziom PODŁOGI)
    Float:width, Float:depth,         // wymiary pokoju (X, Y) - wewnętrzne
    modelWall,                        // model ściany (19379)
    modelFloor,                       // model podłogi (może być też 19379)
    modelCeiling,                     // model sufitu (np. 19379 z inną teksturą)
    worldid = 0,
    interiorid = 0,
    ownerid = 0,
    Float:streamdist = 200.0,
    Float:drawdist = 200.0
)
{
    new segmentsX = floatround(width / WALL_LEN, floatround_ceil);
    new segmentsY = floatround(depth / WALL_LEN, floatround_ceil);

    new Float:realWidth  = segmentsX * WALL_LEN;
    new Float:realDepth  = segmentsY * WALL_LEN;

    new Float:halfW = realWidth  / 2.0;
    new Float:halfD = realDepth  / 2.0;

    new i, j;
    new objectid, sampid;

    // ======================
    // PODŁOGA (19379 położony na boku – rotY = 90)
    // ======================
    for (i = 0; i < segmentsX; i++)
    {
        for (j = 0; j < segmentsY; j++)
        {
            new Float:x = ccx - halfW + (i * WALL_LEN) + WALL_LEN / 2.0;
            new Float:y = ccy - halfD + (j * WALL_LEN) + WALL_LEN / 2.0;
            new Float:z = ccz;

            objectid = Iter_Free(DynamicObjects);
            sampid = CreateDynamicObject(
                modelFloor,
                x, y, z,
                0.0, 90.0, 0.0,         // <- KŁUcczOWE: położyć panel poziomo
                worldid, interiorid, -1,
                streamdist, drawdist
            );

            StworzObiekt(objectid, sampid,
                x, y, z,
                0.0, 90.0, 0.0,
                worldid, interiorid,
                2, ownerid, 0);
        }
    }

    // ======================
    // SUFIT (taki sam jak podłoga, tylko wyżej)
    // ======================
    new Float:ceilingZ = ccz + WALL_HEIGHT; // realna wysokość ściany / sufitu

    for (i = 0; i < segmentsX; i++)
    {
        for (j = 0; j < segmentsY; j++)
        {
            new Float:x = ccx - halfW + (i * WALL_LEN) + WALL_LEN / 2.0;
            new Float:y = ccy - halfD + (j * WALL_LEN) + WALL_LEN / 2.0;
            new Float:z = ceilingZ;

            objectid = Iter_Free(DynamicObjects);
            sampid = CreateDynamicObject(
                modelCeiling,
                x, y, z,
                0.0, 90.0, 0.0,         // też położony płasko
                worldid, interiorid, -1,
                streamdist, drawdist
            );

            // jeśli chcesz jaśniejszy sufit:
            SetDynamicObjectMaterial(sampid, 0, 16639, "a51_labs", "dam_terazzo", 0xFFFFFFFF);
            Object_SetMMAT(objectid, sampid, 0, 16639, "a51_labs", "dam_terazzo", 0xFFFFFFFF);

            StworzObiekt(objectid, sampid,
                x, y, z,
                0.0, 90.0, 0.0,
                worldid, interiorid,
                2, ownerid, 0);
        }
    }

    // ======================
    // ŚCIANY (19379 pionowo, długość wzdłuż Y przy rotZ=0)
    // ======================

    new Float:wallZ = ccz + WALL_HEIGHT / 2.0;

    // --- POŁUDNIE (dół, wzdłuż X) ---
    for (i = 0; i < segmentsX; i++)
    {
        new Float:x = ccx - halfW + (i * WALL_LEN) + WALL_LEN / 2.0;
        new Float:y = ccy - halfD;

        objectid = Iter_Free(DynamicObjects);
        sampid = CreateDynamicObject(
            modelWall,
            x, y, wallZ,
            0.0, 0.0, 90.0,            // długość panelu po osi X
            worldid, interiorid, -1,
            streamdist, drawdist
        );

        StworzObiekt(objectid, sampid,
            x, y, wallZ,
            0.0, 0.0, 90.0,
            worldid, interiorid,
            2, ownerid, 0);
    }

    // --- PӣNOC (góra, wzdłuż X) ---
    for (i = 0; i < segmentsX; i++)
    {
        new Float:x = ccx - halfW + (i * WALL_LEN) + WALL_LEN / 2.0;
        new Float:y = ccy + halfD;

        objectid = Iter_Free(DynamicObjects);
        sampid = CreateDynamicObject(
            modelWall,
            x, y, wallZ,
            0.0, 0.0, 90.0,
            worldid, interiorid, -1,
            streamdist, drawdist
        );

        StworzObiekt(objectid, sampid,
            x, y, wallZ,
            0.0, 0.0, 90.0,
            worldid, interiorid,
            2, ownerid, 0);
    }

    // --- ZACHÓD (lewa, wzdłuż Y) ---
    for (j = 0; j < segmentsY; j++)
    {
        new Float:x = ccx - halfW;
        new Float:y = ccy - halfD + (j * WALL_LEN) + WALL_LEN / 2.0;

        objectid = Iter_Free(DynamicObjects);
        sampid = CreateDynamicObject(
            modelWall,
            x, y, wallZ,
            0.0, 0.0, 0.0,             // długość panelu po osi Y
            worldid, interiorid, -1,
            streamdist, drawdist
        );

        StworzObiekt(objectid, sampid,
            x, y, wallZ,
            0.0, 0.0, 0.0,
            worldid, interiorid,
            2, ownerid, 0);
    }

    // --- WSCHÓD (prawa, wzdłuż Y) ---
    for (j = 0; j < segmentsY; j++)
    {
        new Float:x = ccx + halfW;
        new Float:y = ccy - halfD + (j * WALL_LEN) + WALL_LEN / 2.0;

        objectid = Iter_Free(DynamicObjects);
        sampid = CreateDynamicObject(
            modelWall,
            x, y, wallZ,
            0.0, 0.0, 0.0,
            worldid, interiorid, -1,
            streamdist, drawdist
        );

        StworzObiekt(objectid, sampid,
            x, y, wallZ,
            0.0, 0.0, 0.0,
            worldid, interiorid,
            2, ownerid, 0);
    }

    // SOUTH wall entrance:
    House[ownerid][h_exit_pos][0] = House[ownerid][h_enter_pos][0];
    House[ownerid][h_exit_pos][1] = House[ownerid][h_enter_pos][1] - halfD + 1.0;
    House[ownerid][h_exit_pos][2] = House[ownerid][h_enter_pos][2] + 1.0 + 100;



    return 1;
}
