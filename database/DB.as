namespace DB{
    void Initialize(){
        if(Constants::Data.GetType() == Json::Type::Null){
            Constants::Data = Json::Object();
            Constants::Data["Favorites"] = Json::Array();
            Constants::Data["Version"] = "0.0.1";
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
    
    void AddFavorite(string mapId){
        Json::Value favList = Constants::Data["Favorites"];
        Json::Value favorite = Json::Object();
        favorite["MapId"] = mapId;
        favorite["Group"] = "default";
        bool exists = false;
        for(uint i = 0; i<favList.Length;i++){
            if(favList[i]["MapId"] == mapId){
                exists = true;
            }
        }
        if(!exists){
            favList.Add(favorite);
        }
        Constants::Data["Favorites"] = favList;
        Save(); 
    }
    
    void RemoveFavorite(string mapId){
        Json::Value favList = Constants::Data["Favorites"];

        for(uint i=0; i<favList.Length; i++){
            if(favList[i]["MapId"] == mapId){
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
