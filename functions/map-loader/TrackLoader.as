namespace TrackLoader{
    string TrackUrl = "";
    string Uid = "";


    /* Starts a track with a given TrackUrl (loaded from nadeo api)  */
    void LoadTrack(){
        Json::Value favData = RestClient::GetTrackInfoByUid(Uid);
        TrackUrl = favData["downloadUrl"];
        CTrackMania@ app = cast<CTrackMania>(GetApp());
        //The TitleControlScriptAPI can only be called while in main menu, so the first step is to get to there.
        app.BackToMainMenu();
        /* Wait until the ManiaTitleControlScriptApi is callable */
        while(!app.ManiaTitleControlScriptAPI.IsReady){
            yield();
        }
        app.ManiaTitleControlScriptAPI.PlayMap(TrackUrl,"","");
    }
    
    void LoadNonTMXMap(){
        // CTrackMania@ app = cast<CTrackMania>(GetApp());
        // string uid = app.RootMap.MapInfo.MapUid;
        // string url = RestClient::GetTrackUrlByUid(uid);
        // TrackUrl = url;
        // print("loading track: " + TrackUrl);
        // LoadTrack();
        // print("please get loadet");
    }

    /* Loads and connects to the current trackoftheday live server by using the live-services nadeo api */
    void LoadTrackOfTheDay(){
        try{
            NadeoServices::AddAudience("NadeoLiveServices");
            while (!NadeoServices::IsAuthenticated("NadeoLiveServices")) {
            yield();
            }
            /* Try to get the current joinLink to the TrackOfTheDay Live Server */
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
            Json::Value joinInfo = Json::Parse(req.String());
            if(joinInfo.GetType() == Json::Type::Null){
                return;
            }
            string joinLink =joinInfo["joinLink"];
            if(joinLink == ""){
                return;
            }
            /* Join the LiveServer by the given Join Link */
            CTrackMania@ app = cast<CTrackMania>(GetApp());
            app.ManiaPlanetScriptAPI.OpenLink(joinLink, CGameManiaPlanetScriptAPI::ELinkType::ManialinkBrowser);
            // request.Start();
        }catch{
            print("couldn't load trackoftheday: " + getExceptionInfo());
        }
    }

}
