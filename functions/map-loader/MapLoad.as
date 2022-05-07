namespace MapLoader{
    void LoadMapTMX(int mapID){
        CTrackMania@ app = cast<CTrackMania>(GetApp());
        app.BackToMainMenu();
        while(!app.ManiaTitleControlScriptAPI.IsReady){
            yield();
        }
        string mapURL = "https://trackmania.exchange/maps/download/" + mapID;
        app.ManiaTitleControlScriptAPI.PlayMap(mapURL,"","");
    }

    void TestLoadMapTMX(){
        LoadMapTMX(39736);
    }
}
