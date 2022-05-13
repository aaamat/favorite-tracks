class Dialog : IRenderable
{

	//The ID is set by the calling the parent constructor in the child class. It represents the Name of the Window and is shown in the title bar
	string m_id;

	//Represents if the current window is open or closed (set by the Window itself in UI::Begin)
	bool isOpen = false;
	bool ForceClose = false;
	/* The Window settings (size) */
	vec2 m_size = vec2(100, 100);
    int m_flags = UI::WindowFlags::NoSavedSettings | UI::WindowFlags::NoResize;

	Dialog(const string &in id)
	{
		m_id = id;
	}

	void Render()
	{
		//The Render process is stoped when the window isnt visible anymore.
		//This shouldnt be necessary tho, because the window itself will be removed out of the IRenderables Array when not visible
		if(!isOpen) return;
		UI::OpenPopup(m_id);

		UI::PushStyleColor(UI::Col::PopupBg, vec4(.1, .1, .1, 1));
		UI::SetNextWindowSize(int(m_size.x), int(m_size.y));
		if(UI::BeginPopupModal(m_id, isOpen, m_flags)){
			RenderDialog();
			UI::EndPopup();
		}
		UI::PopStyleColor(1);
	}

	bool IsVisible(){
		if(ForceClose == true){
			return false;
		}else{
			return isOpen;
		}
	}

	void RenderDialog()
	{
	}
}