namespace Constants{
    Resources::Font@ HEADER1;
    const string JSON_FILE = IO::FromDataFolder("MapSwitcherData.json");
    Json::Value Data = Json::FromFile(JSON_FILE);
}
