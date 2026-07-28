/*

by Luigi Auriemma

*/

HINSTANCE       gslist_hInstance;
NOTIFYICONDATA  gslist_tray;
u8              gslist_tray_run[64];
#define         gslist_tray_run_execute ShellExecute(NULL, "open", gslist_tray_run, NULL, NULL, SW_SHOW)

#define ID_MYICON       WM_USER + 1
#define WM_TRAY_NOTIFY  WM_USER + 2
#define IDR_POPUP_MENU  WM_USER + 3
#define ID_APP_RELOAD   WM_USER + 4
#define ID_APP_ABOUT    WM_USER + 5
#define ID_APP_EXIT     WM_USER + 6



int gslist_tray_menu(HWND hWnd) {
    POINT   pt;
    HMENU   hMenu,
            hPopupMenu;
    int     ret;

    hMenu = LoadMenu(gslist_hInstance, MAKEINTRESOURCE(IDR_POPUP_MENU));
    hPopupMenu = GetSubMenu(hMenu, 0);
    SetMenuDefaultItem(hPopupMenu, -1, TRUE);

    GetCursorPos(&pt);
    SetForegroundWindow(hWnd);
    ret = TrackPopupMenu(hPopupMenu, TPM_RETURNCMD | TPM_LEFTALIGN, pt.x, pt.y, 0, hWnd, NULL);
    DestroyMenu(hPopupMenu);
    DestroyMenu(hMenu);
    return(ret);
}



LRESULT CALLBACK wndProc(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam) {
    switch(message) {
        case WM_CREATE:
            return(TRUE);
        case WM_DESTROY:
            gslist_tray.cbSize = sizeof(NOTIFYICONDATA);
            gslist_tray.hWnd   = hwnd;
            Shell_NotifyIcon(NIM_DELETE, &gslist_tray);
            PostQuitMessage(0);
            exit(0);
            return(TRUE);
        case WM_TRAY_NOTIFY:
            if((lParam == WM_RBUTTONUP) || (lParam == WM_LBUTTONUP)) {
                switch(gslist_tray_menu(hwnd)) {
                    case ID_APP_RELOAD: gslist_tray_run_execute;                break;
                    case ID_APP_ABOUT:  MessageBox(0, GSTITLE, "Gslist", MB_OK | MB_ICONINFORMATION);   break;
                    case ID_APP_EXIT:   SendMessage(hwnd, WM_DESTROY, 0, 0);    break;
                    default: break;
                }
            }
            return(TRUE);
        default: break;
    }
    return(DefWindowProc(hwnd, message, wParam, lParam));
}



quick_thread(gsweb_tray, struct sockaddr_in *peer) {
    HWND        hwnd;
    WNDCLASSEX  wc;
    MSG         msg;
    char        classname[] = "Gslist.NOTIFYICONDATA.hWnd";

    memset(&wc, 0, sizeof(wc));
    wc.cbSize        = sizeof(wc);
    wc.lpfnWndProc   = wndProc;
    wc.hInstance     = gslist_hInstance;
    wc.lpszClassName = classname;
    wc.hIcon         = LoadIcon(gslist_hInstance,  MAKEINTRESOURCE(ID_MYICON));
    wc.hIconSm       = LoadImage(gslist_hInstance, MAKEINTRESOURCE(ID_MYICON), IMAGE_ICON, GetSystemMetrics(SM_CXSMICON), GetSystemMetrics(SM_CYSMICON), 0);
    RegisterClassEx(&wc);

    hwnd = CreateWindowEx(0, classname, classname, WS_POPUP,
        CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
        NULL, NULL, gslist_hInstance, NULL);

    memset(&gslist_tray, 0, sizeof(gslist_tray));
    gslist_tray.cbSize           = sizeof(gslist_tray);
    gslist_tray.hWnd             = hwnd;
    gslist_tray.uID              = 1;
    gslist_tray.uFlags           = NIF_MESSAGE | NIF_ICON | NIF_TIP;
    gslist_tray.uCallbackMessage = WM_TRAY_NOTIFY;
    gslist_tray.hIcon            = LoadImage(gslist_hInstance, MAKEINTRESOURCE(ID_MYICON), IMAGE_ICON, GetSystemMetrics(SM_CXSMICON), GetSystemMetrics(SM_CYSMICON), 0);
    strcpy(gslist_tray.szTip, "Gslist "VER);
    Shell_NotifyIcon(NIM_ADD, &gslist_tray);

    sprintf(gslist_tray_run, "http://%s:%hu", inet_ntoa(peer->sin_addr), ntohs(peer->sin_port));
    gslist_tray_run_execute;

    while(GetMessage(&msg, NULL, 0, 0)) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }
    return(0);
}


