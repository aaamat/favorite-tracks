namespace UI
{
    bool ColoredButton(const string &in text, float h, float s = 0.6f, float v = 0.6f)
    {
        UI::PushStyleColor(UI::Col::Button, UI::HSV(h, s, v));
        UI::PushStyleColor(UI::Col::ButtonHovered, UI::HSV(h, s + 0.1f, v + 0.1f));
        UI::PushStyleColor(UI::Col::ButtonActive, UI::HSV(h, s + 0.2f, v + 0.2f));
        bool ret = UI::Button(text);
        UI::PopStyleColor(3);
        return ret;
    }
    /* The grey button needs to be specified seperate, because the hover and active effect is calculated differntly */
    bool GreyButton(const string &in text)
    {
        UI::PushStyleColor(UI::Col::Button, UI::HSV(0.0f, 0.0f, 0.6f));
        UI::PushStyleColor(UI::Col::ButtonHovered, UI::HSV(0.0f, 0.7f, 0.7f));
        UI::PushStyleColor(UI::Col::ButtonActive, UI::HSV(0.0f, 0.8f, 0.8f));
        bool ret = UI::Button(text);
        UI::PopStyleColor(3);
        return ret;
    }

    bool RedButton(const string &in text) { return ColoredButton(text, 0.0f); }
    bool GreenButton(const string &in text) { return ColoredButton(text, 0.33f); }
    bool OrangeButton(const string &in text) { return ColoredButton(text, 0.155f); }
    bool CyanButton(const string &in text) { return ColoredButton(text, 0.5f); }
    bool PurpleButton(const string &in text) { return ColoredButton(text, 0.8f); }
    bool RoseButton(const string &in text) { return ColoredButton(text, 0.9f); }
}