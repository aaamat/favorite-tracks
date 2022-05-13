namespace Favorites{
    
    string Uid;

    /* Adds the given UID to the favorites JSON Array and saves the data file */
    void FavorizeByUid(){
        Json::Value track = RestClient::GetTrackIdByUid(Uid);
        if(track.GetType() == Json::Type::Null){
            return;
        }
        int64 trackId = track["TrackID"];
        //Map titles may include some style codes to show colors, etc. This is getting stripped away here
        string trackName = StripFormatCodes(track["Name"]);
        string trackAuthor = track["Username"];
        DB::AddFavorite(trackId + "", trackName, trackAuthor);
    }
}