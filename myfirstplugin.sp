#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "My First Plugin",
	author = "munch",
	description = "Prints to server 'hello world'",
	version = "1.0",
	url = "munch.codes"
};

public void OnPluginStart() // forward; calls in
{
	PrintToServer("hello world"); // native; calls out
}
