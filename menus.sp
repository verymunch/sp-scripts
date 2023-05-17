#include <sourcemod>
#include <sdktools>
/*
when using includes, make sure they are placed within the
C:...\sourcepawn\configs\sm_1_8_5914\include folder
*/ 
#include <cstrike> // limits plugin to CS:Source/CS:GO

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = {
	name = "Simple Menu",
	author = "munch",
	description = "Learning menu displays",
	version = "1.0",
	url = "munch.codes"
};

public void OnPluginStart() {
	RegConsoleCmd("sm_test", Command_Test, "Displays a test menu");
}

public Action Command_Test(int client, int args) {
	Menu menu = new Menu(Menu_Callback);
	menu.SetTitle("Test Menu :)");
	// first arg internally identifies selected option, second arg is what is presented to player
	// secret third param called ITEMDRAW_DEFAULT
	// can use ITEMDRAW_DISABLED to grey out option(s)
	menu.AddItem("option1", "Option 1", (GetClientTeam(client) == CS_TEAM_CT)?ITEMDRAW_DEFAULT:ITEMDRAW_DISABLED); 
	menu.AddItem("option2", "Option 2"); 
	// first arg is client, second arg is amount of time menu is displayed for
	menu.Display(client, 30);
	return Plugin_Handled;
}

public int Menu_Callback(Menu menu, MenuAction action, int param1, int param2) {
	switch (action) {
		case MenuAction_Select:
		{
			char item[32];
			menu.GetItem(param2, item, sizeof(item));
			
			if (StrEqual(item, "option1")) {
				// do stuff
			}
			
			else if (StrEqual(item, "option2")) {
				// do more stuff			
			}
		}
		case MenuAction_End:
		{
			delete menu; // delete menu to prevent memory leak
		}
	}
}