//inttv.pwn
//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: interior.pwn ]------------------------------------------//
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
//BY- Kvbus, dodane by Sandał
//-----------------<[ Główne funkcje: ]>-------------------
GoldenPalms_Init()
{
	StworzObiekty();
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(19379, 2755.184326, -1186.680541, 81.676963, 0.000000, 90.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6102, "gazlaw1", "law_gazwhitefloor", 0x00000000);
    tmpobjid = CreateDynamicObject(19387, 2755.152832, -1181.956176, 83.522888, 360.000000, 360.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(19443, 2757.558837, -1181.967285, 83.522911, 360.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(19443, 2752.747802, -1181.967285, 83.522911, 360.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(19443, 2754.569580, -1181.636840, 83.522911, 360.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(19462, 2757.723388, -1183.754638, 83.512886, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(1723, 2756.973388, -1183.885986, 81.752891, 0.000000, 0.000000, 270.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(3801, 2757.323242, -1182.719604, 83.922843, 0.000000, 0.000000, 180.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19462, 2752.408691, -1183.854370, 83.512886, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(1723, 2753.099853, -1184.786865, 81.722885, 0.000000, 0.000000, 450.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(3801, 2752.751953, -1182.719604, 83.922843, 0.000000, 0.000000, 360.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19387, 2752.414306, -1190.268066, 83.522888, 360.000000, 360.000000, 180.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(19387, 2757.726806, -1190.177978, 83.512886, 360.000000, 360.000000, 180.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(19379, 2755.184326, -1196.310058, 81.676963, 0.000000, 90.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6102, "gazlaw1", "law_gazwhitefloor", 0x00000000);
    tmpobjid = CreateDynamicObject(19379, 2755.184326, -1186.680541, 85.146919, 0.000000, 90.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8130, "vgsschurch", "vgschapelwall01_64", 0x00000000);
    tmpobjid = CreateDynamicObject(19462, 2754.903076, -1191.905029, 83.512886, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(19379, 2755.184326, -1196.297241, 85.146919, 0.000000, 90.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8130, "vgsschurch", "vgschapelwall01_64", 0x00000000);
    tmpobjid = CreateDynamicObject(19379, 2765.673828, -1186.680541, 81.676963, 0.000000, 90.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6102, "gazlaw1", "law_gazwhitefloor", 0x00000000);
    tmpobjid = CreateDynamicObject(19462, 2762.594970, -1182.365234, 83.512886, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(19462, 2767.492675, -1187.225463, 83.512886, 0.000000, 0.000000, 360.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(19462, 2762.591308, -1191.403076, 83.512886, 0.000000, 0.000000, 450.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(19999, 2761.037597, -1186.346191, 81.762916, 0.000000, 0.000000, 180.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF333333);
    tmpobjid = CreateDynamicObject(2115, 2759.508300, -1184.875854, 82.012847, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF000000);
    SetDynamicObjectMaterial(tmpobjid, 1, -1, "none", "none", 0xFF666666);
    tmpobjid = CreateDynamicObject(2115, 2760.529296, -1184.875854, 82.042854, 0.000000, 180.000000, 360.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF000000);
    SetDynamicObjectMaterial(tmpobjid, 1, -1, "none", "none", 0xFF000000);
    SetDynamicObjectMaterial(tmpobjid, 2, -1, "none", "none", 0xFF000000);
    tmpobjid = CreateDynamicObject(2115, 2761.469238, -1184.875854, 82.012847, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF000000);
    SetDynamicObjectMaterial(tmpobjid, 1, -1, "none", "none", 0xFF666666);
    tmpobjid = CreateDynamicObject(2115, 2762.491210, -1184.875854, 82.042854, 0.000000, 180.000000, 360.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF000000);
    SetDynamicObjectMaterial(tmpobjid, 1, -1, "none", "none", 0xFF666666);
    tmpobjid = CreateDynamicObject(19999, 2762.328857, -1186.346191, 81.762916, 0.000000, 0.000000, 180.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF333333);
    tmpobjid = CreateDynamicObject(19999, 2759.926513, -1186.346191, 81.762916, 0.000000, 0.000000, 180.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF333333);
    tmpobjid = CreateDynamicObject(19999, 2762.328857, -1183.406005, 81.762916, 0.000000, 0.000000, 360.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF333333);
    tmpobjid = CreateDynamicObject(19999, 2760.937500, -1183.406005, 81.762916, 0.000000, 0.000000, 360.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF333333);
    tmpobjid = CreateDynamicObject(19999, 2759.676269, -1183.406005, 81.762916, 0.000000, 0.000000, 360.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF333333);
    tmpobjid = CreateDynamicObject(19999, 2763.970214, -1184.836791, 81.762916, 0.000000, 0.000000, 630.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF333333);
    tmpobjid = CreateDynamicObject(19379, 2765.686279, -1186.680541, 85.146919, 0.000000, 90.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8130, "vgsschurch", "vgschapelwall01_64", 0x00000000);
    tmpobjid = CreateDynamicObject(1738, 2767.168701, -1183.048217, 82.383010, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 1, -1, "none", "none", 0xFFFFFFFF);
    SetDynamicObjectMaterial(tmpobjid, 2, -1, "none", "none", 0xFFFFFFFF);
    SetDynamicObjectMaterial(tmpobjid, 3, -1, "none", "none", 0xFF000000);
    tmpobjid = CreateDynamicObject(3801, 2757.390380, -1191.369995, 83.922843, 0.000000, 0.000000, 540.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(19379, 2744.693115, -1186.680541, 81.676963, 0.000000, 90.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6102, "gazlaw1", "law_gazwhitefloor", 0x00000000);
    tmpobjid = CreateDynamicObject(19462, 2747.651367, -1184.827636, 83.512886, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(19462, 2747.841796, -1187.255249, 83.512886, 0.000000, 0.000000, 180.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(2299, 2751.705078, -1187.635864, 81.702888, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF000000);
    tmpobjid = CreateDynamicObject(19786, 2752.289062, -1187.144409, 83.792907, 0.000000, 0.000000, 270.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF000000);
    tmpobjid = CreateDynamicObject(2372, 2751.461425, -1185.128540, 81.762901, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF000000);
    tmpobjid = CreateDynamicObject(19379, 2744.703857, -1187.211059, 85.146919, 0.000000, 90.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 8130, "vgsschurch", "vgschapelwall01_64", 0x00000000);
    tmpobjid = CreateDynamicObject(19379, 2744.723388, -1196.310058, 81.676963, 0.000000, 90.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 6102, "gazlaw1", "law_gazwhitefloor", 0x00000000);
    tmpobjid = CreateDynamicObject(19462, 2745.292480, -1191.910400, 83.512886, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 7488, "vegasdwntwn1", "villainnwall02_128", 0x00000000);
    tmpobjid = CreateDynamicObject(1828, 2761.498535, -1188.843383, 81.762901, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFF996666);
    tmpobjid = CreateDynamicObject(2069, 2758.056396, -1188.443603, 81.802932, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, -1, "none", "none", 0xFFFFFFFF);
    SetDynamicObjectMaterial(tmpobjid, 1, -1, "none", "none", 0xFFFFFFFF);
    SetDynamicObjectMaterial(tmpobjid, 2, -1, "none", "none", 0xFFFFFFFF);
    tmpobjid = CreateDynamicObject(1506, 2755.906005, -1181.957275, 81.762916, 360.000000, 0.000000, 180.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(630, 2753.033203, -1185.573120, 82.702926, 0.000000, 0.000000, -1.400012, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2256, 2757.598632, -1187.251342, 83.632904, 0.000000, 0.000000, 270.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2255, 2756.587890, -1182.604370, 83.162948, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2251, 2752.891357, -1186.822875, 82.612907, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(1724, 2753.126953, -1188.276977, 81.762901, 0.000000, 0.000000, 91.399986, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2264, 2753.002685, -1187.806640, 83.262855, 0.000000, 0.000000, 1170.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2267, 2752.537841, -1183.856689, 83.522880, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2001, 2757.143310, -1186.825683, 81.732902, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(1502, 2752.447509, -1191.052246, 81.762901, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(1502, 2757.730468, -1190.962158, 81.762901, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2257, 2755.014160, -1191.770263, 83.512931, 0.000000, 0.000000, 180.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(19165, 2757.833007, -1184.931030, 83.762886, 90.000000, 90.000000, 720.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(955, 2764.455810, -1190.767089, 82.172882, 0.000000, 0.000000, -148.899978, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2821, 2759.953125, -1184.961059, 82.802909, 0.000000, 0.000000, 20.899993, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(19893, 2762.171630, -1185.123779, 82.812973, 0.000000, 0.500000, -6.199997, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(19893, 2762.664794, -1184.781616, 82.802894, 0.000000, 0.000000, 99.200019, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(19894, 2760.087158, -1185.329345, 82.822868, 0.000000, 0.000000, -5.199995, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(19894, 2760.401855, -1184.625854, 82.812866, 0.000000, 0.000000, -5.199995, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2860, 2761.346923, -1184.924438, 82.812934, 4.999999, 0.200000, 0.199999, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(1736, 2753.704345, -1182.371093, 83.932846, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2153, 2767.131103, -1186.154418, 81.762901, 0.000000, 0.000000, 270.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2154, 2767.137939, -1189.609252, 81.762901, 0.000000, 0.000000, 270.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2151, 2767.130859, -1186.866333, 81.762901, 0.000000, 0.000000, 270.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2151, 2767.135498, -1188.240722, 81.762901, 0.000000, 0.000000, 270.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2152, 2766.214355, -1190.979248, 81.732894, 0.000000, 0.000000, 180.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2155, 2767.128906, -1190.717285, 81.742897, 0.000000, 0.000000, 720.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2153, 2767.131103, -1185.443847, 81.762901, 0.000000, 0.000000, 270.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2152, 2767.135253, -1184.067138, 81.732894, 0.000000, 0.000000, 270.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(1575, 2767.096191, -1186.724853, 82.792831, 0.000000, 0.000000, -24.000007, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(1575, 2767.000244, -1187.201904, 82.792831, 0.000000, 0.000000, -99.399940, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(1575, 2767.046630, -1186.925048, 82.952835, 0.000000, 0.000000, 112.800117, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(335, 2766.859375, -1186.734741, 83.361038, -153.199951, 0.000000, -102.900070, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2858, 2766.992431, -1187.963500, 82.832931, 0.000000, 0.000000, 54.399990, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(19564, 2765.591064, -1190.951904, 82.782867, 0.000000, 0.000000, -14.299999, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2814, 2766.176757, -1190.936523, 82.722938, -0.199999, -4.799999, 6.699998, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2814, 2766.172607, -1190.938476, 82.752830, -0.199999, -4.799999, -41.300003, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2814, 2766.731689, -1190.918579, 82.746131, 0.200000, 2.599998, -37.600021, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(19525, 2767.012207, -1184.252685, 82.772804, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2768, 2766.934326, -1188.699584, 82.882858, 0.000000, 0.000000, -136.500030, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2830, 2766.992431, -1189.517700, 82.702957, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(16779, 2762.436279, -1186.561767, 85.182823, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(19173, 2761.279296, -1191.259399, 83.602928, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(1808, 2757.274169, -1191.377563, 81.732894, 0.000000, 0.000000, 180.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2001, 2753.152832, -1191.436279, 81.732902, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2259, 2758.911376, -1190.689331, 83.182876, 0.000000, 0.000000, 180.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(19173, 2761.279296, -1191.259399, 83.602928, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(19173, 2761.279296, -1191.259399, 83.602928, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2842, 2755.685791, -1183.375488, 81.762901, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(1417, 2748.787109, -1185.346313, 82.012847, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2394, 2750.796386, -1185.357910, 82.482849, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2273, 2750.962646, -1185.441528, 83.512947, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2811, 2748.733398, -1185.204467, 82.912933, 0.000000, 0.000000, 0.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2842, 2755.685791, -1185.196899, 81.762901, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2842, 2755.685791, -1187.028076, 81.762901, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2842, 2755.685791, -1188.849487, 81.762901, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2842, 2755.685791, -1190.680664, 81.762901, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2842, 2755.685791, -1192.509765, 81.762901, 0.000000, 0.000000, 90.000000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(2307, 2749.636962, -1191.084472, 81.762901, 0.000000, 0.000000, 87.599990, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(11735, 2748.449951, -1191.273315, 82.752937, 0.000000, 0.000000, 37.400005, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(11735, 2748.466796, -1191.046752, 82.742935, 0.000000, 0.000000, 37.400005, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(19036, 2748.344238, -1190.771484, 82.811157, -6.699999, -42.700004, -9.600000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(19016, 2748.391113, -1190.580810, 82.792900, 0.000000, 0.000000, 14.500000, 15, 0, -1, 150.00, 150.00); 
    tmpobjid = CreateDynamicObject(19162, 2748.463134, -1190.287841, 82.753540, -0.199996, -84.199989, -25.000000, 15, 0, -1, 150.00, 150.00); 
	DodajWejscie(2756.3889,-1182.5364,69.4000, 2755.3391,-1182.4965,82.7629, 0, 0, 15, 0, "Golden Palms\nConnection", "Wyjście");
	return 1;
}

