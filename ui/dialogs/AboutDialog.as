class AboutDialog : Window{
    AboutDialog(){
        super("Favorite Tracks - About");
        m_size = vec2(600, 400);
    }
    void RenderDialog() override{
        UI::Text("Favorite Tracks");
        UI::Text("Authors: Tamaaa, Headscracher");
        UI::Text("URL: https://github.com/aaamat/favorite-tracks");
        UI::SetCursorPos(vec2(UI::GetCursorPos().x, UI::GetCursorPos().y + 15));
        UI::Text("Map Switcher was only possible with the following Open-Source-Projects");
        vec2 tabSize = vec2(UI::GetWindowSize().x - 30, UI::GetWindowSize().y - UI::GetCursorPos().y - 36);
        UI::BeginTabBar("Credittabs");
        if(UI::BeginTabItem("ItemExchange")){
            UI::PushStyleColor(UI::Col::ChildBg, UI::HSV(0.0f, 0.0f, 0.15f));
            UI::BeginChild("ItemExchangeChild", tabSize);
            UI::SetCursorPos(vec2(UI::GetCursorPos().x + 10, UI::GetCursorPos().y + 10));
            UI::Text("URL: https://github.com/RuurdBijlsma/tm-item-exchange");
            UI::SetCursorPos(vec2(UI::GetCursorPos().x + 10, UI::GetCursorPos().y));
            UI::Text("License");
            UI::PushStyleColor(UI::Col::ChildBg, UI::HSV(0.0f, 0.0f, 1.0f));
            UI::BeginChild("ItemExchangeLicense", vec2(tabSize.x - 10, 250));
            UI::PushStyleColor(UI::Col::Text, UI::HSV(0.0f, 0.0f, 0.0f));
            UI::SetCursorPos(vec2(UI::GetCursorPos().x + 100, UI::GetCursorPos().y + 10));
            UI::TextWrapped("No License given");
            UI::PopStyleColor(1);
            UI::EndChild();
            UI::PopStyleColor(1);
            UI::EndChild();
            UI::PopStyleColor(1);
            UI::EndTabItem();
        }
        if(UI::BeginTabItem("ManiaExchange Randomizer")){
            UI::PushStyleColor(UI::Col::ChildBg, UI::HSV(0.0f, 0.0f, 0.15f));
            UI::BeginChild("ManiaExchangeChild", tabSize);
            UI::SetCursorPos(vec2(UI::GetCursorPos().x + 10, UI::GetCursorPos().y + 10));
            UI::Text("URL: https://github.com/tm-rmc/MXRandom");
            UI::SetCursorPos(vec2(UI::GetCursorPos().x + 10, UI::GetCursorPos().y));
            UI::Text("License");
            UI::PushStyleColor(UI::Col::ChildBg, UI::HSV(0.0f, 0.0f, 1.0f));
            UI::BeginChild("ManiaExchangeLicense", vec2(tabSize.x - 10, 250));
            UI::PushStyleColor(UI::Col::Text, UI::HSV(0.0f, 0.0f, 0.0f));
            UI::SetCursorPos(vec2(UI::GetCursorPos().x + 100, UI::GetCursorPos().y + 10));
            UI::TextWrapped(Licenses::GPLLICENSE);
            UI::SetCursorPos(vec2(UI::GetCursorPos().x + 100, UI::GetCursorPos().y));
            UI::TextWrapped(Licenses::GPLLICENSE2);
            UI::PopStyleColor(1);
            UI::EndChild();
            UI::PopStyleColor(1);
            UI::EndChild();
            UI::PopStyleColor(1);
            UI::EndTabItem();
        }
        if(UI::BeginTabItem("Ultimate Medals")){
            UI::PushStyleColor(UI::Col::ChildBg, UI::HSV(0.0f, 0.0f, 0.15f));
            UI::BeginChild("UltimateMedalsChild", tabSize);
            UI::SetCursorPos(vec2(UI::GetCursorPos().x + 10, UI::GetCursorPos().y + 10));
            UI::Text("URL: https://github.com/Phlarx/tm-ultimate-medals");
            UI::SetCursorPos(vec2(UI::GetCursorPos().x + 10, UI::GetCursorPos().y));
            UI::Text("License");
            UI::PushStyleColor(UI::Col::ChildBg, UI::HSV(0.0f, 0.0f, 1.0f));
            UI::BeginChild("UltimateMedalsLicense", vec2(tabSize.x - 10, 250));
            UI::PushStyleColor(UI::Col::Text, UI::HSV(0.0f, 0.0f, 0.0f));
            UI::SetCursorPos(vec2(UI::GetCursorPos().x + 100, UI::GetCursorPos().y + 10));
            UI::TextWrapped(Licenses::GPLLICENSE);
            UI::SetCursorPos(vec2(UI::GetCursorPos().x + 100, UI::GetCursorPos().y));
            UI::TextWrapped(Licenses::GPLLICENSE2);
            UI::PopStyleColor(1);
            UI::EndChild();
            UI::PopStyleColor(1);
            UI::EndChild();
            UI::PopStyleColor(1);
            UI::EndTabItem();
        }
        UI::EndTabBar();
    }
}
AboutDialog aboutDialog;