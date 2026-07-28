#include "query.h"
#include <windows.h>
#include <string.h>
#include <shlobj.h>
#include <stdio.h>
#include <conio.h>
void DisableQuickEdit(void)
{
    HANDLE hIn = GetStdHandle(STD_INPUT_HANDLE);

    DWORD mode;
    if (GetConsoleMode(hIn, &mode))
    {
        mode &= ~ENABLE_QUICK_EDIT_MODE;
        mode |= ENABLE_EXTENDED_FLAGS;

        SetConsoleMode(hIn, mode);
    }
}

void get_directory(char* path)
{
    // Get directory
    char dir [MAX_PATH];
    GetModuleFileNameA(NULL, dir, MAX_PATH);

    // Remove filename
    char *fix = strrchr(dir, '\\');
    if (fix)
    {
        *fix = '\0';
    }

    // Copy back
    strcpy(path,dir);
}

int get_server_list (const char* path)
{
    // Function does the following:
    // - Copies cfg file to gslist roaming folder (needed to find servers)
    // - Runs gslist

    // - Saves gslist server results into txt

    //  COPY CFG SEQUENECE ///

    // Get roaming folder
    PWSTR roaming_folder = NULL;
    wchar_t gslist_folder [MAX_PATH];
    wchar_t cfg_path [MAX_PATH];
    HRESULT hr = SHGetKnownFolderPath(&FOLDERID_RoamingAppData, 0, NULL, &roaming_folder);
    if (SUCCEEDED(hr))
    {
        //wprintf(L"roaming folder: %ls\n", roaming_folder);
        CoTaskMemFree(roaming_folder);
    }
    else
    {
        printf("ERROR GETTING ROAMING PATH");
        return 0;
    }

    // Setup gslist cfg path string
    swprintf_s(gslist_folder, MAX_PATH, L"%ls\\gslist\\gslist.cfg", roaming_folder);
    //wprintf(L"gslist folder: %ls\n", gslist_folder);

    // Setup new cfg path string
    swprintf_s(cfg_path, MAX_PATH, L"%hs\\gslist\\gslist.cfg", path);
    //wprintf(L"cfg path: %ls\n", cfg_path);

    // Run gslist at least once to ensure roaming folder exists
    char ini_command [MAX_PATH];
    sprintf(ini_command, "cd \"%s\\gslist\" && gslist -u", path);
    system(ini_command);

    // Copy cfg to cglist roaming folder
    CopyFileW(cfg_path, gslist_folder, FALSE);


    /////////////////////////


    // RUNNING GSLIST //////

    // Initalize gslist
    system(ini_command);

    // Get server list (saves to /gslist/servers.txt)
    system("cls");
    printf("\033[0;32mGSLIST HAS BEEN CONFIGURED!\033[0m\n");
    printf("\033[0;32mPLEASE WAIT WHILE QUERYING OCCURS\033[0m\n");
    char get_list_command [MAX_PATH];
    sprintf(get_list_command, "cd \"%s\\gslist\" && gslist -x master.openspy.net -n thps4pc ^ -X \"\\hostname\\mapname\\numplayers\" -Q 1 > servers.txt", path);
    system(get_list_command);

    ////////////////////////
    return 1;
}

int display_server_list (char *path)
{
    system("cls");
    printf("Use 'W' and 'S' to navigate browser, press enter to join server\n\n");
    // Open servers.txt
    FILE* server_list = fopen ("gslist/servers.txt","r");
    if (server_list == NULL)
    {
        printf("ERROR WITH DISPLAYING SERVER LIST, GSLIST DIDN'T RUN CORRECTLY\033[0m\n");
        return 0;
    }

    // Parse amd display at the same time
    char text_buffer [512];
    int server_count = 0;
    int server_choice = 0;
    char join_ip [50];

    while (fgets (text_buffer, sizeof(text_buffer), server_list) != NULL)
    {
        char hostname [20];
        char mapname [20];
        int numplayers = 0;
        int buffer_index = 0;
        int write_index = 0;

        // Sever name parse
        while (text_buffer[buffer_index] != ' ') buffer_index++;
        buffer_index+=11; // Move buffer index to actual server name
        while (text_buffer[buffer_index] != '\\')
        {
            hostname[write_index++] = text_buffer[buffer_index++];
        }
        hostname[write_index] = '\0';
        printf("Sever name : %s\n", hostname);

        // Reset write index and move buffer index to map name
        write_index = 0;
        buffer_index+=9;

        // Map name parse
        while (text_buffer[buffer_index] != '\\')
        {
            mapname[write_index++] = text_buffer[buffer_index++];
        }
        mapname[write_index] = '\0';
        printf("Map name : %s\n", mapname);

        // Move buffer index to player count
        buffer_index+=12;

        // Player count parse
        numplayers = text_buffer[buffer_index] - 48;
        printf("Player count : %d/8\n\n", numplayers);

        server_count++;
    }


    // No one hosting check
    if (server_count == 0)
    {
        printf("No one's hosting right now :(\n");
        printf("Press ENTER to quit");
        _getch();
        return 0;
    }

    // Input section
    int x = 30;
    int y = 3;
    cursorpos(y, x);
    printf("<------");

    char input;
    while ((input = _getch()) != '\r')
    {
        if ( (input == 'W' || input == 'w') && server_choice > 0)
        {
            erase (y,20,20);
            server_choice--;
            y-=4;
            cursorpos(y, 30);
            draw_arrow();
        }

        if ((input == 'S' || input == 's') && server_choice < server_count - 1)
        {
            erase (y,20,20);
            server_choice++;
            y+=4;
            cursorpos(y, 30);
            draw_arrow();
        }
    }

    // Launch THPS4
    rewind(server_list);
    int buffer_index = 0;
    for (int i =0; i < server_choice +1; i++) fgets (text_buffer, sizeof(text_buffer), server_list);
    while (text_buffer[buffer_index] != ':') {join_ip[buffer_index] = text_buffer[buffer_index]; buffer_index++;}

    join_ip[buffer_index] = '\0';
    printf("  Joining IP : %s\n", join_ip);

    char launch_th4 [256];
    sprintf(launch_th4, "THPS4 -connect %s -group #GSP!thps4pc#", join_ip);
    printf("%s\n", launch_th4);
    system(launch_th4);



    // Close serers.txt
    fclose(server_list);
    return 1;
}

void erase (int y, int x, int amount) // Erases characters starting from y,x
{
    cursorpos(y, x);
    for (int counter = 0; counter < amount; counter++)
    {
        printf(" ");
    }
}

void cursorpos (int y, int x) // Sets cursor to specific location (y and x)
{
    printf("\033[%d;%dH", y, x);
}

void draw_arrow ()
{
    printf("<------");
}