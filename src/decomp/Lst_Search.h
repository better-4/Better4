#ifndef _LST_SEARCH_H_
#define _LST_SEARCH_H_

typedef struct Lst_Search {
    void *vtable;
    void *node;
} Lst_Search;

Lst_Search Lst_Search_PlayerInfo();
void *Lst_Search_NextItem(Lst_Search *this);

#endif
