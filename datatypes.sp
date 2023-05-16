#include <sourcemod>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "Data Types",
	author = "munch",
	description = "Learning data types",
	version = "1.0",
	url = "munch.codes"
};

public void OnPluginStart() 
{
	// cell_t - everything in sourcepawn (excluding chars) is built on cell_t
	// int - whole number (i.e 123, 0, -123)
	// bool - true or false
	// float - decimals (i.e 12.5, 1.4, 56.7)
	// char - a single character (i.e a, 2, b, r, m, 7)
	// int a = 23;
	// bool b = true;
	// float c = 22.3;
	// char d = 'm';
	
	// arrays
	// int arr[5] = [1, 2, 3, 4, 5];
	// int a = arr[0];
	// int b = arr[1];
	// int c = arr[2];
	// int d = arr[3];
	// int e = arr[4];
	
	/* 
	technically there's an extra space at the end of this
	character array (33), that's a secret character 
	called a 'null terminator' that has a byte of zero
	*/
	char str[32] = "test";
	PrintToServer(str);
}