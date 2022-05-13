namespace Favorites{
    
    string Uid;
    wstring trackName;
    wstring trackAuthor;

    /* Adds the given UID to the favorites JSON Array and saves the data file */
    void FavorizeByUid(){
        //Map titles may include some style codes to show colors, etc. This is getting stripped away here
        // string trackName = StripFormatCodes(track["Name"]);
        // string trackAuthor = track["Username"];
        DB::AddFavorite(Uid, trackName, trackAuthor);
    }
}