class FavoriteDialog : ModalDialog
{
    string favIcon = Icons::Kenney::HeartO;

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

            int positionY = UI::GetCursorPos().y;
            UI::SetCursorPos(vec2(UI::GetCursorPos().x + 15, positionY + 18));
            UI::PushFont(Constants::HEADER1);
            UI::Text("Current Map: Technica Via");
            UI::PopFont();
            UI::SameLine();
            UI::SetCursorPos(vec2(UI::GetCursorPos().x, positionY + 15));
            UI::GreyButton(favIcon);
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

            if (UI::BeginTable("FavList", 4, UI::TableFlags::ScrollY)){
                // UI::AlignTextToFramePadding(); 
                UI::TableSetupColumn("", UI::TableColumnFlags::WidthFixed, 0);
                UI::TableSetupColumn("Name", UI::TableColumnFlags::WidthStretch, 3);
                UI::TableSetupColumn("Author", UI::TableColumnFlags::WidthStretch, 2);
                UI::TableSetupColumn("Actions", UI::TableColumnFlags::WidthFixed, 95);
                UI::TableHeadersRow();
                UI::TableNextRow();
                UI::TableSetColumnIndex(0);
                UI::Dummy(vec2(0, 0));
                UI::SameLine();
                auto img = Images::CachedFromURL("https://trackmania.exchange/tracks/thumbnail/57885");
                UI::CyanButton(Icons::FileImageO);
                    if (UI::IsItemHovered() && img.m_texture !is null){
                        UI::BeginTooltip();
                        UI::Image(img.m_texture, vec2(400, 290));
                        UI::EndTooltip();
                    }
                UI::TableSetColumnIndex(1);
                // UI::AlignTextToFramePadding();
                UI::Text("Streckenname2");
                UI::TableSetColumnIndex(2);
                UI::Text("Author2");
                UI::TableSetColumnIndex(3);
                UI::PushStyleColor(UI::Col::Button, UI::HSV(0.0f, 0.7f, 0.7f));
                UI::Button(Icons::Kenney::Heart);
                UI::PopStyleColor(1);
                UI::SameLine();
                UI::GreenButton(Icons::Play);
                UI::TableNextRow();
                UI::TableSetColumnIndex(0);
                UI::Dummy(vec2(0, 0));
                UI::SameLine();
                img = Images::CachedFromURL("https://trackmania.exchange/tracks/thumbnail/57885");
                UI::CyanButton(Icons::FileImageO);
                    if (UI::IsItemHovered() && img.m_texture !is null){
                        UI::BeginTooltip();
                        UI::Image(img.m_texture, vec2(400, 290));
                        UI::EndTooltip();
                    }
                UI::TableSetColumnIndex(1);
                // UI::AlignTextToFramePadding();
                UI::Text("Streckenname1");
                UI::TableSetColumnIndex(2);
                UI::Text("Author1");
                UI::TableSetColumnIndex(3);
                UI::PushStyleColor(UI::Col::Button, UI::HSV(0.0f, 0.7f, 0.7f));
                UI::Button(Icons::Kenney::Heart);  
                UI::PopStyleColor(1);
                UI::SameLine();
                UI::GreenButton(Icons::Play);
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