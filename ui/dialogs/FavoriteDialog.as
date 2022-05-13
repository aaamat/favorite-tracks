class FavoriteDialog : Window
{
    string favIcon = Icons::Kenney::HeartO;
    wstring trackName = "Currently No Track Loaded";
    CTrackMania@ app = cast<CTrackMania>(GetApp());

    FavoriteDialog(){
        super("Map Switcher");
        m_size = vec2(600, 400);
    }

    void RenderDialog() override{
        UI::BeginTabBar("MainDialogTabs", UI::TabBarFlags::FittingPolicyResizeDown);
        vec2 tabSize = vec2(UI::GetWindowSize().x - 16, UI::GetWindowSize().y - UI::GetCursorPos().y - 36);
        UI::PushStyleColor(UI::Col::Tab, UI::HSV(0.0f, 0.6f, 0.6f));
        UI::PushStyleColor(UI::Col::TabHovered, UI::HSV(0.0f, 0.7f, 0.7f));
        UI::PushStyleColor(UI::Col::TabActive, UI::HSV(0.0f, 0.8f, 0.8f)); 
        if (UI::BeginTabItem(Icons::Heart + " Favorites")){

            UI::PushStyleColor(UI::Col::ChildBg, UI::HSV(0.0f, 0.0f, 0.15f));
            UI::BeginChild("TopBar", vec2(tabSize.x, (UI::GetWindowSize().y - UI::GetCursorPos().y) / 1.03));

            float positionY = UI::GetCursorPos().y;
            UI::SetCursorPos(vec2(UI::GetCursorPos().x + 15, positionY + 18));
            UI::PushFont(Constants::HEADER1);

            auto map = app.RootMap;
            if (map != null){
                trackName = StripFormatCodes(map.MapInfo.Name);
            }
            UI::Text("Current Track: " + trackName);
            UI::PopFont();
            UI::SameLine();
            UI::SetCursorPos(vec2(UI::GetCursorPos().x, positionY + 15));
            if (UI::GreyButton(favIcon)){
                Favorites::Uid = map.MapInfo.MapUid;
                Favorites::trackName = StripFormatCodes(map.MapInfo.Name);
                Favorites::trackAuthor = map.MapInfo.AuthorNickName;
                startnew(Favorites::FavorizeByUid);
//              mapID = RestClient::GetTrackIdByUid(map.MapInfo.MapUid) + "";
            }
            
            if (UI::IsItemHovered()){
                favIcon = Icons::Kenney::Heart;
            }
            else {
                favIcon = Icons::Kenney::HeartO;
            }

            UI::SetCursorPos(vec2(UI::GetCursorPos().x, UI::GetCursorPos().y + 10));
            UI::PushStyleColor(UI::Col::ChildBg, UI::HSV(0.0f, 0.0f, 0.15f));
            UI::BeginChild("FavListChild");

            UI::PushStyleVar(UI::StyleVar::CellPadding, vec2(12, 6));
            UI::PushStyleVar(UI::StyleVar::FramePadding, vec2(10, 6));   

            Json::Value favArray = DB::GetFavorites();
            CachedImage@ img = Images::CachedFromURL("");
        
            if (UI::BeginTable("FavList", 4, UI::TableFlags::ScrollY)){
                // UI::AlignTextToFramePadding(); 
                UI::TableSetupColumn("", UI::TableColumnFlags::WidthFixed, 0);
                UI::TableSetupColumn("Name", UI::TableColumnFlags::WidthStretch, 3);
                UI::TableSetupColumn("Author", UI::TableColumnFlags::WidthStretch, 2);
                UI::TableSetupColumn("Actions", UI::TableColumnFlags::WidthFixed, 95);
                UI::TableHeadersRow();
                UI::TableNextRow();
                UI::TableSetColumnIndex(0);
                
                /* Loop over all favorites */
                for(uint i = 0; i < favArray.Length; i++){
                    UI::PushID("favorites" + i);
                    UI::TableSetColumnIndex(0);
                    UI::Dummy(vec2(0, 0));
                    UI::SameLine();
                    dictionary@ data;
                    string trackId = favArray[i]["TrackId"];
                    string imgUrl = favArray[i]["Thumbnail"];
                    img = Images::CachedFromURL(imgUrl);
                    /* Image button (shows the image on hover) */
                    UI::CyanButton(Icons::FileImageO);
                    if (UI::IsItemHovered() && img.m_texture !is null){
                        UI::BeginTooltip();
                        UI::Image(img.m_texture, vec2(400, 290));
                        UI::EndTooltip();
                    }
                    UI::TableSetColumnIndex(1);
                    UI::Text(favArray[i]["TrackName"]);
                    UI::TableSetColumnIndex(2);
                    UI::Text(favArray[i]["Author"]);
                    UI::TableSetColumnIndex(3);
                    UI::PushStyleColor(UI::Col::Button, UI::HSV(0.0f, 0.7f, 0.7f));
                    // string trackName = favArray[i]["TrackName"];
                    // string trackIdFav = favArray[i]["TrackId"];
                    /* Favorize Button */
                    if(UI::Button(Icons::Kenney::Heart)){
                        DB::RemoveFavorite(trackId);
                    }
                    UI::PopStyleColor(1);
                    UI::SameLine();
                    /* Play track button */
                    if(UI::GreenButton(Icons::Play)){
                        TrackLoader::Uid = trackId;
                        startnew(TrackLoader::LoadTrack);
                    }
                    UI::PopID();
                    UI::TableNextRow();
                }
                UI::Separator();
                UI::TableSetColumnIndex(1);
                UI::Text("Current Track of the day");
                UI::TableSetColumnIndex(2);
                UI::Text("unknown");
                UI::TableSetColumnIndex(3);
                if(UI::GreenButton(Icons::Play)){
                    // TrackLoader::TrackUrl = "https://trackmania.exchange/maps/download/" + trackIdFav;
                    // startnew(TrackLoader::LoadTrack);
                    startnew(TrackLoader::LoadTrackOfTheDay);
                }
                
                UI::EndTable();
            }

            UI::PopStyleVar(2);
            UI::EndChild();
            UI::PopStyleColor(1);
            UI::EndChild();
            UI::PopStyleColor(1);
            UI::EndTabItem();
        }
        UI::PopStyleColor(3);
        UI::PushStyleColor(UI::Col::Tab, UI::HSV(0.65f, 0.6f, 0.6f));
        UI::PushStyleColor(UI::Col::TabHovered, UI::HSV(0.65f, 0.7f, 0.7f));
        UI::PushStyleColor(UI::Col::TabActive, UI::HSV(0.65f, 0.8f, 0.8f));         
        if (UI::BeginTabItem(Icons::Search + " Search")){
            UI::BeginChild("Tab2", tabSize);
            UI::Text("Hallo2");
            UI::EndChild();
            UI::EndTabItem();
        }        
        UI::PopStyleColor(3);
        UI::EndTabBar();
    }
}
FavoriteDialog favDialog;