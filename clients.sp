#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "Storing Client Data",
	author = "munch",
	description = "Setting client data",
	version = "1.0",
	url = "munch.codes"
};

/*
int client is size 65 MAXPLAYERS + 1
client is just an index in an array
0 <= client <= 65
can only have 64 players + 1 accounting for the server
where 0 client is the console/server and 1 is the start of human clients/players 
MaxClients = ?
for example, a server of 12 players has a MaxClient size of 13 (including the server) 
*/

// g = global, a = array, i = int, etc
int ga_iNumber[MAXPLAYERS + 1] =  { 0, ... };

public void OnPluginStart() 
{
	RegConsoleCmd("sm_set", Command_Set, "Sets your number");
	RegConsoleCmd("sm_get", Command_Get, "Gets your number");
}

public Action Command_Set(int client, int args)
{
	if (args != 1)
	{
		ReplyToCommand(client, "[SM] Usage: sm_set <num>");
		return Plugin_Handled;
	}
	
	char arg1[33];
	GetCmdArg(1, arg1, sizeof(arg1));
	int num = StringToInt(arg1);
	ga_iNumber[client] = num;
	
	ReplyToCommand(client, "[SM] Number %d was successfully set!", num);
	return Plugin_Handled;
}

public Action Command_Get(int client, int args)
{
	if (args != 0)
	{
		ReplyToCommand(client, "[SM] Usage: sm_get");
		return Plugin_Handled;
	}
	
	ReplyToCommand(client, "[SM] Your number is: %d", ga_iNumber[client]);
	return Plugin_Handled;
}

public void OnClientPutInServer(int client) // could use OnClientConnected
{
	ResetVariables(client);
}

public void OnClientDisconnect(int client)
{
	ResetVariables(client);
}

void ResetVariables(int client)
{
	ga_iNumber[client] = 0;
}