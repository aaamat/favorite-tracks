void Main(){
    DB::Initialize();
    //Cant be initialized in the Constants File iteslf so it it assigned when loading the plugin
    @Constants::HEADER1 = Resources::GetFont("DroidSans.ttf", 18);
}

void RenderMenu(){
    if(UI::MenuItem("\\$e22" + Icons::Heart + "\\$z Map Switcher")){
        favDialog.isOpen = !favDialog.isOpen;
        Renderables::Add(favDialog);
    }
    if(UI::BeginMenu("Map Switcher")){
        if(UI::MenuItem("About")){
            aboutDialog.isOpen = !aboutDialog.isOpen;     
            Renderables::Add(aboutDialog);
        }
        UI::EndMenu();
    }
}

void Render(){
    //Renders all the currently added IRenderables
    Renderables::Render();
}