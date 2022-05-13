class DeleteFavoriteDialog : Dialog{
    string Uid = "";
    string FavName = "";
    DeleteFavoriteDialog(){
        super("Delete Favorite");
        m_size = vec2(300, 150);
    }
    void RenderDialog() override{
        UI::SetCursorPos(vec2(UI::GetCursorPos().x + 10, UI::GetCursorPos().y + 10));;
        UI::TextWrapped("Are you sure you want to delete the favorite " + FavName);
        UI::PushStyleColor(UI::Col::Button, UI::HSV(0.0f, 0.7f, 0.7f));
        UI::SetCursorPos(vec2(UI::GetCursorPos().x + 10, UI::GetCursorPos().y + 10));;
        if(UI::Button("Yes")){
            DB::RemoveFavorite(Uid);
            ForceClose = true;
        }
        UI::PopStyleColor(1);
        UI::SameLine();
        if(UI::GreyButton("Cancel")){
            ForceClose = true;
		    // UI::CloseCurrentPopup();
        }
    }
}
DeleteFavoriteDialog deleteFavoriteDialog;