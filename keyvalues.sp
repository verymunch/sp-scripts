#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "Parsing Key Values",
	author = "munch",
	description = "Parses key values of a config file",
	version = "1.0",
	url = "munch.codes"
};

public void OnPluginStart() 
{
	ParseKV();
}

void ParseKV() {
	char path[PLATFORM_MAX_PATH];
	BuildPath(Path_SM, path, sizeof(path), "configs/weapons_test.cfg");
	
	if (!FileExists(path)) {
		SetFailState("Configuration file %s is not found", path);
		return; // not necessary 
	}
	
	KeyValues kv = new KeyValues("Weapons");
	if (!kv.ImportFromFile(path)) {
		SetFailState("Unable to parse Key Values file %s", path);
		return;
	}
	
	if (!kv.JumpToKey("Rifles")) {
		SetFailState("Unable to find Rifles section in file %s", path);
		return;
	}
	
	if (!kv.GotoFirstSubKey()) {
		SetFailState("Unable to find Rifles's sub-section in file %s", path);
		return;
	}
	
	do {
		char entity[100];
		char name[32];
		char team[32];
		
		kv.GetSectionName(entity, sizeof(entity));
		kv.GetString("name", name, sizeof(name));
		kv.GetString("team", team, sizeof(team));
		
		PrintToServer("%s - %s - %s", entity, name, team);
	} while (kv.GotoNextKey());
	
	kv.Rewind();
	
	if (!kv.JumpToKey("Pistols")) {
		SetFailState("Unable to find Pistols section in file %s", path);
		return;
	}
	
	if (!kv.GotoFirstSubKey()) {
		SetFailState("Unable to find Pistols's sub-section in file %s", path);
		return;
	}
	
	do {
		char entity[100];
		char name[32];
		char team[32];
		
		kv.GetSectionName(entity, sizeof(entity));
		kv.GetString("name", name, sizeof(name));
		kv.GetString("team", team, sizeof(team));
		
		PrintToServer("%s - %s - %s", entity, name, team);
	} while (kv.GotoNextKey());
	
	delete kv;
	return;
}