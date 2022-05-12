void Main(){
    print("hallo welt");
    DB::Initialize();
    // DB::AddFavorite("12221121");
    // DB::RemoveFavorite("12221121");
    @Constants::HEADER1 = Resources::GetFont("DroidSans.ttf", 18);
}

void RenderMenu(){
    if(UI::MenuItem("\\$e22" + Icons::Heart + "\\$z Map Switcher")){
        // Renderables::Add(FavoriteDialog());
        favDialog.isOpen = !favDialog.isOpen;
    }
    if(UI::BeginMenu("Map Switcher")){
        if(UI::MenuItem("About")){
            aboutDialog.isOpen = !aboutDialog.isOpen;     
        }
        UI::EndMenu();
    }
}

void Render(){
    // Renderables::Render();
    favDialog.Render();
    aboutDialog.Render();
}