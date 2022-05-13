class Window : IRenderable
{

	//The ID is set by the calling the parent constructor in the child class. It represents the Name of the Window and is shown in the title bar
	string m_id;

	//Represents if the current window is open or closed (set by the Window itself in UI::Begin)
	bool isOpen = false;
	/* The Window settings (size and flags) */
	vec2 m_size = vec2(100, 100);
    int m_flags = UI::WindowFlags::NoSavedSettings;

	Window(const string &in id)
	{
		m_id = id;
	}

	void Render()
	{
		//The Render process is stoped when the window isnt visible anymore.
		//This shouldnt be necessary tho, because the window itself will be removed out of the IRenderables Array when not visible
		if(!isOpen) return;

		UI::PushStyleColor(UI::Col::WindowBg, vec4(0.1f, 0.1f, 0.1f, 1.0f));
		if(UI::Begin(m_id, isOpen)){
			UI::SetNextWindowSize(int(m_size.x), int(m_size.y));
			RenderDialog();
			UI::End();
		}
		UI::PopStyleColor(1);
	}

	bool IsVisible(){
		return isOpen;
	}

	void RenderDialog()
	{
	}
}