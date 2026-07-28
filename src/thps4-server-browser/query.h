#pragma once

void get_directory(char* path); //name
int get_server_list (const char* path); // Gets TH4PC server list using gslist, stores in servers.txt
int display_server_list (char *path); // Parses and displays server list in terminal
void list_controls (int input); // Handles input from user
void launch_thps4 (char *ip_port); // Launches THPS4 and will join selected server
void erase (int y, int x, int amount); // Erases characters starting from y,x
void cursorpos (int y, int x); // Sets cursor to specific location (y and x)
void draw_arrow ();
void DisableQuickEdit(void);

