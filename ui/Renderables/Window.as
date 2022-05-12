class Window : IRenderable
{
	string m_id;
	bool m_firstRender = false;
	bool m_visible = true;

	bool isOpen = false;
	vec2 m_size = vec2(100, 100);
    int m_flags = UI::WindowFlags::NoSavedSettings;

	Window(const string &in id)
	{
		m_id = id;
	}

	void Render()
	{
		if(!isOpen) return;

		UI::PushStyleColor(UI::Col::WindowBg, vec4(0.1f, 0.1f, 0.1f, 1.0f));
		if(UI::Begin(m_id, isOpen)){
			UI::SetNextWindowSize(int(m_size.x), int(m_size.y));
			RenderDialog();
			//UI::PopStyleColor(1);
			UI::End();
		}
		UI::PopStyleColor(1);
		// }
		// UI::End();

	}

	bool CanClose()
	{
		return true;
	}

	bool ShouldDisappear()
	{
		return !m_visible;
	}

	void Close()
	{
		m_visible = false;
		UI::CloseCurrentPopup();
	}

	void RenderDialog()
	{
	}
}