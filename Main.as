void Main(){
    DB::Initialize();
    //Cant be initialized in the Constants File iteslf so it it assigned when loading the plugin
    @Constants::HEADER1 = UI::LoadFont("DroidSans.ttf", 18);
}

void RenderMenu(){
    if(UI::MenuItem("\\$e22" + Icons::Heart + "\\$z Favorites")){
        favDialog.isOpen = !favDialog.isOpen;
        Renderables::Add(favDialog);
    }
}
void RenderMenuMain(){
    if(UI::BeginMenu("\\$e22" + Icons::Heart + "\\$z Favorite Tracks")){
        if(UI::MenuItem("\\$e22" + Icons::Heart + "\\$z Favorites")){
            favDialog.isOpen = !favDialog.isOpen;
            Renderables::Add(favDialog);
        }
        if(UI::MenuItem("\\$69f" +Icons::Kenney::InfoCircle + "\\$z About")){
            aboutDialog.isOpen = !aboutDialog.isOpen;     
            Renderables::Add(aboutDialog);
        }
        UI::EndMenu();
    }
}

void RenderInterface(){
    //Renders all the currently added IRenderables
    Renderables::Render();
}