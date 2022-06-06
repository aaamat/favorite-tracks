/*
* Constants is used for all values needed across multiple namespaces and classes
* Mostly there are constants defined in here, but values like the Json Data are initialized here as well
*/
namespace Constants{
    UI::Font@ HEADER1;
    /*The JSON File used for all Settings, including the set Favorites*/
    const string JSON_FILE = IO::FromDataFolder("MapSwitcherData.json");
    Json::Value Data = Json::FromFile(JSON_FILE);
    const string APIRueckgabe = IO::FromDataFolder("test.json");
    const string APIURL = "https://trackmania.exchange/api/";
}
