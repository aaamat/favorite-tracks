namespace Favorites{
    
    string Uid;
    wstring trackName;
    wstring trackAuthor;

    /* Adds the given UID to the favorites JSON Array and saves the data file */
    void FavorizeByUid(){
        DB::AddFavorite(Uid, trackName, trackAuthor);
    }
}