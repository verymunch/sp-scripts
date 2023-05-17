#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "Console Variables",
	author = "munch",
	description = "Learning how to use convars",
	version = "1.0",
	url = "munch.codes"
};

/*
convars are console variables that allow users to change certain aspects of a plugin or game
convars can hold any data type
example convars
sv_allowupload 1 (sv:server)
cl_something (cl:client)
sm_something (sm:sourcemod)
*/
ConVar gcv_bKickFriend = null;
ConVar gcv_sKickFriend = null;
ConVar gcv_bAllowUpload = null;

public void OnPluginStart() 
{
	gcv_bKickFriend = CreateConVar("sm_kick_friend", "0", "Kicks my friend when they join");
	gcv_sKickFriend = CreateConVar("sm_kick_friend", "", "Kicks my friend when they join");
	gcv_bAllowUpload = FindConVar("sv_allowupload"); // checks for existing convar
	gcv_bAllowUpload.AddChangeHook(OnUploadChanged);
}

// check whether or not a convar value has changed, use a change hook
public void OnUploadChanged(ConVar convar, const char[] oldvalue, const char[] newvalue) {
	gcv_bAllowUpload.BoolValue; // displays convar value
	
	if (StrEqual(newvalue, "1")) {
		// can get the default value of convar
		// char default1[32];
		// gcv_bAllowUpload.GetDefault(default1, sizeof(default1));
		gcv_bAllowUpload.BoolValue = false; // overrides attempt to change value
	}
}

// simpler and efficient option 
public void OnClientAuthorized(int client, const char[] auth) {
	char convarvalue[64];
	gcv_sKickFriend.GetString(convarvalue, sizeof(convarvalue));
	
	if (strlen(convarvalue) > 0) {
		if (StrEqual(convarvalue, auth)) {
			KickClient(client, "Later");
		}
	}
}

public void OnClientPutInServer(int client) {
	// only kick when convar value is 1 
	if (gcv_bKickFriend.BoolValue)
	{
		char name[MAX_NAME_LENGTH];
		GetClientName(client, name, sizeof(name));
		
		if (StrEqual(name, "P0nze")) { // would use their SteamID instead
			KickClient(client, "Later");
		}
	}
}