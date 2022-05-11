namespace Favorites{
    
    string Uid;

    void FavorizeByUid(){
        int64 trackId = RestClient::GetTrackIdByUid(Uid);
        DB::AddFavorite(trackId + "");
    }
}