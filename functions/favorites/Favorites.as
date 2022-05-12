namespace Favorites{
    
    string Uid;

    void FavorizeByUid(){
        print(Uid);
        Json::Value track = RestClient::GetTrackIdByUid(Uid);
        if(track.GetType() == Json::Type::Null){
            return;
        }
        int64 trackId = track["TrackID"];
        string trackName = StripFormatCodes(track["Name"]);
        string trackAuthor = track["Username"];
        DB::AddFavorite(trackId + "", trackName, trackAuthor);
    }
}