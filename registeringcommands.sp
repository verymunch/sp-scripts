#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "Registering Commands",
	author = "munch",
	description = "Prints to server 'Test!'",
	version = "1.0",
	url = "munch.codes"
};

public void OnPluginStart() // global/public forward
{
	// sm_test allows to type this command in chat: !test
	RegConsoleCmd("sm_test", Command_Test, "Prints test to chat"); // native
}

/* 
example command: sm_ban person 0 
this command contains 2 args: (1) person is the player
and (2) 0 is the time
*/
public Action Command_Test(int client, int args) // private forward
{
	if (args > 0) 
	{
		ReplyToCommand(client, "[SM] Usage: sm_test"); // native
		return Plugin_Handled;
	}
	
	ReplyToCommand(client, "Test!"); // native
	return Plugin_Handled;
}