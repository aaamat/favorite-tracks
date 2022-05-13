namespace DB{
    void Initialize(){
        if(Constants::Data.GetType() == Json::Type::Null){
            Constants::Data = Json::Object();
            Constants::Data["Favorites"] = Json::Array();
            Constants::Data["Version"] = "1.0.0";
            Save();
        }
    }
    
    Json::Value GetFavorites(){
        Json::Value favorites = Constants::Data["Favorites"];
        if(favorites.GetType() == Json::Type::Null){
            favorites = Json::Array();
        }
        return favorites;
    }
    
    bool IsFavorite(string trackId){
        Json::Value favList = Constants::Data["Favorites"];
        for(uint i=0; i<favList.Length; i++){
            if(favList[i]["TrackId"] == trackId){
                return true;
            }
        }
        return false;
    }
    
    void AddFavorite(string trackId, wstring trackName, wstring trackAuthor){
        Json::Value favList = Constants::Data["Favorites"];
        Json::Value favorite = Json::Object();
        Json::Value favData = RestClient::GetTrackInfoByUid(trackId);
        favorite["TrackId"] = trackId;
        favorite["TrackName"] = string(trackName);
        favorite["Author"] = string(trackAuthor);
        favorite["Thumbnail"] = favData["thumbnailUrl"];
        favorite["Group"] = "default";
        bool exists = false;
        for(uint i=0; i<favList.Length;i++){
            if(favList[i]["TrackId"] == trackId){
                exists = true;
            }
        }
        if(!exists){
            favList.Add(favorite);
        }
        Constants::Data["Favorites"] = favList;
        Save(); 
    }
    
    void RemoveFavorite(string trackId){
        Json::Value favList = Constants::Data["Favorites"];

        for(uint i=0; i<favList.Length; i++){
            if(favList[i]["TrackId"] == trackId){
                favList.Remove(i);
            }
        }
        Constants::Data["Favorites"] = favList;
        Save();
    }
    
    void Save(){
        Json::ToFile(Constants::JSON_FILE, Constants::Data);
    }
}
