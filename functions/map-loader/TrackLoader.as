namespace TrackLoader{
    wstring TrackUrl = "";

    void TestLoadTrackTMX(){
    }

    void LoadTrackLocal(wstring filename){

    }

    void LoadTrack(){
        CTrackMania@ app = cast<CTrackMania>(GetApp());
        app.BackToMainMenu();
        while(!app.ManiaTitleControlScriptAPI.IsReady){
            yield();
        }
        app.ManiaTitleControlScriptAPI.PlayMap(TrackUrl,"","");
    }
    void LoadTrackOfTheDay(){
        try{
            // Net::HttpRequest@ request = NadeoServices::Post("NadeoClubServices", "https://live-services.trackmania.nadeo.live/api/token/channel/daily/join");
            NadeoServices::AddAudience("NadeoLiveServices");
            while (!NadeoServices::IsAuthenticated("NadeoLiveServices")) {
            yield();
            }
            Net::HttpRequest@ req = NadeoServices::Request("NadeoLiveServices");
            req.Method = Net::HttpMethod::Post;
            req.Headers["Accept"] = "application/json";
            req.Headers["Content-Type"] = "application/json";
            req.Url = "https://live-services.trackmania.nadeo.live/api/token/channel/daily/join";
            req.Body = "";
            req.Start();
            while(!req.Finished()){
                yield();
            }
            print(req.String());
            Json::Value joinInfo = Json::Parse(req.String());
            if(joinInfo.GetType() == Json::Type::Null){
                return;
            }
            string joinLink =joinInfo["joinLink"];
            CTrackMania@ app = cast<CTrackMania>(GetApp());
            app.ManiaPlanetScriptAPI.OpenLink(joinLink, CGameManiaPlanetScriptAPI::ELinkType::ManialinkBrowser);
            // request.Start();
        }catch{
            print("test: " + getExceptionInfo());
        }
    }

}
