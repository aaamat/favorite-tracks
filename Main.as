void Main(){
    print("hallo welt");
    @Constants::HEADER1 = Resources::GetFont("DroidSans.ttf", 18);
    MapLoader::TestLoadMapTMX();
}

void RenderMenu(){
    if(UI::MenuItem("\\$e22" + Icons::Heart + "\\$z Map Switcher")){
        Renderables::Add(FavoriteDialog());
    }
}

void Render(){
    Renderables::Render();
}