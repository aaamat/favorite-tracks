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

    /* Trys to get the TrackInfo of MXEchange by the UID of the map. Some maps wont be on TMExchange like the current track of the day */
    Json::Value GetTrackIdByUid(string uid){
        string url = Constants::APIURL + "maps/get_map_info/uid/" + uid;
        //The documentation of the TMExchange tells us to use a user-agent, so we send a fake header with an current firefox user-agent
        dictionary parameter = {{'Content-Type', "application/json"}, {'User-Agent', "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5312 (KHTML, like Gecko) Chrome/38.0.877.0 Mobile Safari/5312"}};
        Json::Value trackInfo = GetRequest(url, parameter);
        /* The track is not on MXExchange uploaded */
        if (trackInfo.GetType() == Json::Type::Null){
            return 0;
        }
        return trackInfo;
    }
}