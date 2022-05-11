namespace MapLoader{
    wstring MapURL = "";

    void LoadMapTMX(int mapID){
        wstring mapURL = "https://trackmania.exchange/maps/download/" + mapID;
    }

    void TestLoadMapTMX(){
        LoadMapTMX(59833);
    }

    void LoadMapLocal(wstring filename){

    }

    void LoadMap(){
        CTrackMania@ app = cast<CTrackMania>(GetApp());
        app.BackToMainMenu();
        while(!app.ManiaTitleControlScriptAPI.IsReady){
            yield();
        }
        app.ManiaTitleControlScriptAPI.PlayMap(MapURL,"","");
    }
}
