void Main(){
    print("hallo welt");
    DB::Initialize();
    // DB::AddFavorite("12221121");
    // DB::RemoveFavorite("12221121");
    @Constants::HEADER1 = Resources::GetFont("DroidSans.ttf", 18);
}

void RenderMenu(){
    if(UI::MenuItem("\\$e22" + Icons::Heart + "\\$z Map Switcher")){
        Renderables::Add(FavoriteDialog());
    }
}

void Render(){
    Renderables::Render();
}