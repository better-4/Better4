#include <stdio.h>
#include "query.h"
#define MAX_PATH 260

int main (void)
{
    DisableQuickEdit();
    int sucess;
    // Get directory
    char directory [MAX_PATH];
    get_directory(directory);
    printf("%s\n",directory);

    // Retrieve server list with gslist and copy to txt
    sucess = get_server_list(directory);
    if (!sucess) return 8008;


    // Display server info and let user choose
    sucess = display_server_list(directory);
    if (!sucess) return 8008;

    // Join game using command arguments

    return 0;
}