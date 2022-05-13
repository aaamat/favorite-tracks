void Main(){
    DB::Initialize();
    //Cant be initialized in the Constants File iteslf so it it assigned when loading the plugin
    @Constants::HEADER1 = Resources::GetFont("DroidSans.ttf", 18);
}

void RenderMenuMain(){
    if(UI::BeginMenu("\\$e22" + Icons::Heart + "\\$z Map Switcher")){
        if(UI::MenuItem("\\$e22" + Icons::Heart + "\\$z Favorites")){
            favDialog.isOpen = !favDialog.isOpen;
            Renderables::Add(favDialog);
        }
        if(UI::MenuItem("\\$69f" +Icons::Kenney::InfoCircle + "\\$z About")){
            aboutDialog.isOpen = !aboutDialog.isOpen;     
            Renderables::Add(aboutDialog);
        }
        if(UI::MenuItem("Test")){
            CTrackMania@ app = cast<CTrackMania>(GetApp());
            
            // print("test " + path);
            // TrackLoader::TrackUrl = path;
            startnew(TrackLoader::LoadNonTMXMap);
        }
        UI::EndMenu();
    }
}

void Render(){
    //Renders all the currently added IRenderables
    Renderables::Render();
}