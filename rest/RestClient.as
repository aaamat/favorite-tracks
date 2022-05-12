namespace RestClient{


    Json::Value GetRequest(string url, dictionary parameter){
        auto request = Net::HttpRequest();
        @request.Headers = parameter;
        request.Method = Net::HttpMethod::Get;
        request.Url = url;
        request.Start();
        while(!request.Finished()){
            yield();
        }
        auto response = Json::Parse(request.String());
        return response;
    }

    Json::Value GetTrackIdByUid(string uid){
        string url = Constants::APIURL + "maps/get_map_info/uid/" + uid;
        dictionary parameter = {{'Content-Type', "application/json"}, {'User-Agent', "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5312 (KHTML, like Gecko) Chrome/38.0.877.0 Mobile Safari/5312"}};
        Json::Value trackInfo = GetRequest(url, parameter);
        if (trackInfo.GetType() == Json::Type::Null){
            return 0;
        }
        return trackInfo;
    }
}