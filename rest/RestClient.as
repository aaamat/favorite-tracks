namespace RestClient{


    /* Runs a GET Request to the given url with the given parameters as header and returns the result as JSON Object */
    Json::Value GetRequest(string url, dictionary parameter){
        auto request = Net::HttpRequest();
        @request.Headers = parameter;
        request.Method = Net::HttpMethod::Get;
        request.Url = url;
        request.Start();
        /* Wait as long as there is no response yet. */
        while(!request.Finished()){
            yield();
        }
        auto response = Json::Parse(request.String());
        return response;
    }

    Json::Value GetTrackInfoByUid(string uid){
        NadeoServices::AddAudience("NadeoLiveServices");
        while (!NadeoServices::IsAuthenticated("NadeoLiveServices")) {
        yield();
        }
        /* Try to get the current joinLink to the TrackOfTheDay Live Server */
        Net::HttpRequest@ req = NadeoServices::Request("NadeoLiveServices");
        req.Method = Net::HttpMethod::Get;
        req.Headers["Accept"] = "application/json";
        req.Headers["Content-Type"] = "application/json";
        req.Url = "https://live-services.trackmania.nadeo.live/api/token/map/" + uid;
        req.Body = "";
        req.Start();
        while(!req.Finished()){
            yield();
        }
        print(req.String());
        Json::Value joinInfo = Json::Parse(req.String());
        if(joinInfo.GetType() == Json::Type::Null){
            return 0;
        }
        return joinInfo;
    }
}