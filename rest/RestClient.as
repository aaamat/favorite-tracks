namespace RestClient{

    string Uid;

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

    void GetTrackIdByUid(){
        string url = Constants::APIURL + "maps/get_map_info/uid/" + Uid;
        dictionary parameter = {{'Content-Type', "application/json"}, {'User-Agent', "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5312 (KHTML, like Gecko) Chrome/38.0.877.0 Mobile Safari/5312"}};
        Json::Value mapInfo = GetRequest(url, parameter);
        Constants::CurrentTrackId = 0;
        if (mapInfo.GetType() == Json::Type::Null){
            return;
        }
        Constants::CurrentTrackId = mapInfo["TrackID"];
    }
}