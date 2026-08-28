///////////////////////////////////////////////////////////////////////////////
// File:    simpletest.c
// SDK:     GameSpy NAT Negotiation SDK
//
// Copyright (c) IGN Entertainment, Inc.  All rights reserved.  
// This software is made available only pursuant to certain license terms offered
// by IGN or its subsidiary GameSpy Industries, Inc.  Unlicensed use or use in a 
// manner not expressly authorized by IGN or GameSpy is prohibited.

#include <UniSpySDK/natneg/natneg.h>
#include <UniSpySDK/common/gsAvailable.h>
#include <UniSpySDK/qr2/qr2.h>
#include <UniSpySDK/serverbrowsing/sb_serverbrowsing.h>
#include <UniSpySDK/serverbrowsing/sb_internal.h>

#define GAME_NAME "thps4pc"
#define GAME_KEY "L3C8s9"

int connected = 0;
SOCKADDR_IN otheraddr;
SOCKET sock = INVALID_SOCKET;
unsigned int ESTRING_SIZE = 128;
char *aString = NULL;
static gsi_bool UpdateFinished = gsi_false; // used to track status of server browser updates

static void tryread(SOCKET s)
{
    char buf[256];
    int len;
    SOCKADDR_IN saddr;
    socklen_t saddrlen = sizeof(saddr);
    while (CanReceiveOnSocket(s))
    {
        len = recvfrom(s, buf, sizeof(buf) - 1, 0, (SOCKADDR *)&saddr, &saddrlen);

        if (len < 0)
        {
            len = GOAGetLastError(s);
            printf("|Got recv error: %d\n", len);
            break;
        }
        buf[len] = 0;
        if (memcmp(buf, NNMagicData, NATNEG_MAGIC_LEN) == 0)
        {
            NNProcessData(buf, len, &saddr);
        } else
            printf("|Got data (%s:%d): %s\n", inet_ntoa(saddr.sin_addr),ntohs(saddr.sin_port), buf);
    }
}

static void pc(NegotiateState state, void *userdata)
{
    if (aString != NULL)
    {
        // Print any status updates to the console
        int charsWritten;

        memset(aString, 0, ESTRING_SIZE);
        charsWritten = sprintf(aString, "Got State Update: ");
        switch(state)
        {
        case ns_initack:
            sprintf(aString + charsWritten,  "ns_initack, Init Packets Acknowledged.\n");
            break;
        case ns_connectping:
            sprintf(aString + charsWritten, "ns_connectping, Starting connection and pinging other machine.\n");
            break;
        default:
            break;
        }

        gsDebugFormat(GSIDebugCat_App, GSIDebugType_Misc, GSIDebugLevel_Notice,
            aString);
    }

    GSI_UNUSED(userdata);
}

static void cc(NegotiateResult result, SOCKET gamesocket, SOCKADDR_IN *remoteaddr, void *userdata)
{
    SOCKADDR_IN saddr;
    socklen_t namelen = sizeof(saddr);
    if (gamesocket != INVALID_SOCKET)
    {
        getsockname(gamesocket, (SOCKADDR *)&saddr, &namelen);

        printf("|Local game socket: %d\n", ntohs(saddr.sin_port));
    }

    if (result != nr_success)
    {
        if (aString == NULL)
            return;
        memset(aString, 0, ESTRING_SIZE);
        switch(result)
        {
        case nr_deadbeatpartner:
            sprintf(aString,  "Result: nr_deadbeatpartner, The other machine isn't responding.\n");
            break;
        case nr_inittimeout:
            sprintf(aString, "Result: nr_inittimeout, The NAT server could not be contacted.\n");
            break;
        case nr_pingtimeout:
            sprintf(aString, "Result: nr_pingtimeout, The other machine could not be contacted.\n");
            break;
        default:
            break;
        }
        
        gsDebugFormat(GSIDebugCat_App, GSIDebugType_Misc, GSIDebugLevel_Notice, aString);
        return;
    }

    printf("|Got connected, remoteaddr: %s, remoteport: %d\n", (remoteaddr == NULL) ? "" : inet_ntoa(remoteaddr->sin_addr), (remoteaddr == NULL) ? 0 : ntohs(remoteaddr->sin_port));
    if (result == nr_success)
    {
        connected = 1;
        memcpy(&otheraddr, remoteaddr, sizeof(otheraddr));
        sock = gamesocket;
    }
    
    GSI_UNUSED(userdata);
}

static void nr(gsi_bool success, NAT nat)
{
    int charsWritten;

    if(success == gsi_false)
    {
        gsDebugFormat(GSIDebugCat_App, GSIDebugType_Misc, GSIDebugLevel_Notice, 
            "Failed to fully detect the NAT.  Please try the detection again.\n");
        return;
    }

    if(aString == NULL)
        return;

    memset(aString, 0, ESTRING_SIZE);
    charsWritten = sprintf(aString, "The detected NAT is a ");
    switch(nat.natType)
    {
    case no_nat:
        charsWritten = sprintf(aString, "No NAT detected.");
        break;
    case firewall_only:
        charsWritten = sprintf(aString, "No NAT detected, but firewall may be present.");
        break;
    case full_cone:
        charsWritten += sprintf(aString + charsWritten, "full cone ");
        break;
    case restricted_cone:
        charsWritten += sprintf(aString + charsWritten, "restricted cone ");
        break;
    case port_restricted_cone:
        charsWritten += sprintf(aString + charsWritten, "port restricted cone ");
        break;
    case symmetric:
        charsWritten += sprintf(aString + charsWritten, "symmetric ");
        break;
    case unknown:
    default:
        charsWritten = sprintf(aString, "Unknown NAT type detected ");
        break;
    }

    if(nat.natType != no_nat && nat.natType != firewall_only)
        switch(nat.mappingScheme)
        {
        case private_as_public:
            charsWritten += sprintf(aString + charsWritten, "and is using the private port as the public port.");
            break;
        case consistent_port:
            charsWritten += sprintf(aString + charsWritten, "and is using the same public port for all requests from the same private port.");
            break;
        case incremental:
            charsWritten += sprintf(aString + charsWritten, "and is using an incremental port mapping scheme.");
            break;
        case mixed:
            charsWritten += sprintf(aString + charsWritten, "and is using a mixed port mapping scheme.");
            break;
        case unrecognized:
        default:
            charsWritten += sprintf(aString + charsWritten, "and is using an unrecognized port mapping scheme.");
            break;
        }

    charsWritten += sprintf(aString + charsWritten, "\n");
    gsDebugFormat(GSIDebugCat_App, GSIDebugType_Misc, GSIDebugLevel_Notice, aString);
}

int natneg_main(int argc, char **argp)
{
    unsigned long lastsendtime = 0;
    GSIACResult result;
    gsi_time startTime;
    NegotiateError error;

#ifdef GSI_MEM_MANAGED  // Use gsi mem managed.
    {
        #define MEMPOOL_SIZE (8* 1024*1024)
        PRE_ALIGN(16) static char _mempool[MEMPOOL_SIZE] POST_ALIGN(16);
        gsMemMgrCreate(gsMemMgrContext_Default, "default", _mempool, MEMPOOL_SIZE);
    }
#endif

    aString = (char *)gsimalloc(ESTRING_SIZE);
    // Perform the sandard GameSpy Availability Check.
    GSIStartAvailableCheck(_T(GAME_NAME));
    while((result = GSIAvailableCheckThink()) == GSIACWaiting)
        msleep(5);
    if(result != GSIACAvailable)
    {
        printf("The backend is not available\n");
        return 1;
    }

    error = NNStartNatDetection(nr);

    sock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
    error = NNBeginNegotiationWithSocket(sock, 666, (argc == 1) ? 0 : 1, pc, cc, NULL);

    if(error != ne_noerror)
    {
        int charsWritten;
        memset(aString, 0, ESTRING_SIZE);
        charsWritten = sprintf(aString, "Error beginning negotiation: ");
        switch(error)
        {
            case ne_allocerror:
                sprintf(aString + charsWritten, "memory allocation failed.\n");
                break;
            case ne_dnserror:
                sprintf(aString + charsWritten, "DNS lookup failed.\n");
                break;
            case ne_socketerror:
                sprintf(aString + charsWritten, "socket failed to be created.\n");
                break;
            default:
                break;
        }

        gsDebugFormat(GSIDebugCat_App, GSIDebugType_Misc, GSIDebugLevel_Notice, aString);
        gsifree(aString);
        return 1;
    }

    startTime = current_time();
    while ((current_time() - startTime) < 60000)
    {
        NNThink();
        if (connected)
        {
            if (current_time() - lastsendtime > 2000)
            {
                int ret = sendto(sock, "woohoo!!", 8, 0, (SOCKADDR *)&otheraddr, sizeof(SOCKADDR_IN));
                int error2 = GOAGetLastError(sock);
                printf("|Sending (%d:%d), remoteaddr: %s, remoteport: %d\n", ret, error2, inet_ntoa(otheraddr.sin_addr), ntohs(otheraddr.sin_port));
                lastsendtime = current_time();
            }
        }
        if (sock != INVALID_SOCKET)
            tryread(sock);
        msleep(10);
    }
    if (sock != INVALID_SOCKET)
        closesocket(sock);

    sock = INVALID_SOCKET;
    SocketShutDown();
    NNFreeNegotiateList();
    gsifree(aString);

    GSI_UNUSED(argp);
    return 0;
}

// callback called as server browser updates process
static void SBCallback(ServerBrowser sb, SBCallbackReason reason, SBServer server, void *instance)
{
	int i; // for-loop ctr
	gsi_char * defaultString = _T("");  // default string for SBServerGet functions - returns if specified string key is not found
	int defaultInt = 0;  // default int value for SBServerGet functions - returns if specified int key is not found
	gsi_char anAddress[20] = { '\0' };  // to store server IP

	// retrieve the server ip
#ifdef GSI_UNICODE
	if (server)
		AsciiToUCS2String(SBServerGetPublicAddress(server),anAddress);
#else
	if (server)
		strcpy(anAddress, SBServerGetPublicAddress(server));
#endif

	switch (reason)
	{
	case sbc_serveradded:  // new SBServer added to the server browser list
		// output the server's IP and port (the rest of the server's basic keys may not yet be available)
		printf(_T("Server Added: %s:%d\n"), anAddress, SBServerGetPublicQueryPort(server));
		break;
	case sbc_serverchallengereceived: // received ip verification challenge from server
		// informational, no action required
		break;
	case sbc_serverupdated:  // either basic or full information is now available for this server
		// retrieve and print the basic server fields (specified as a parameter in ServerBrowserUpdate)
		printf(_T("ServerUpdated: %s:%d\n"), anAddress, SBServerGetPublicQueryPort(server));
		printf(_T("  Host: %s\n"), SBServerGetStringValue(server, _T("hostname"), defaultString));
		printf(_T("  Gametype: %s\n"), SBServerGetStringValue(server, _T("gametype"), defaultString));
		printf(_T("  Map: %s\n"), SBServerGetStringValue(server, _T("mapname"), defaultString));
		printf(_T("  Players/MaxPlayers: %d/%d\n"), SBServerGetIntValue(server, _T("numplayers"), defaultInt), SBServerGetIntValue(server, _T("maxplayers"), defaultInt));
		printf(_T("  Ping: %dms\n"), SBServerGetPing(server));
		
		// if the server has full keys (ServerBrowserAuxUpdate), print them
		if (SBServerHasFullKeys(server))
		{
			// print some non-basic server info
			printf(_T("  Frag limit: %d\n"), SBServerGetIntValue(server, _T("fraglimit"), defaultInt));
			printf(_T("  Time limit: %d minutes\n"), SBServerGetIntValue(server, _T("timelimit"), defaultInt));
			printf(_T("  Gravity: %d\n"), SBServerGetIntValue(server, _T("gravity"), defaultInt));

			// print player info
			printf(_T("  Players:\n"));
			for(i = 0; i < SBServerGetIntValue(server, _T("numplayers"), 0); i++) // loop through all players on the server 
			{
				// print player key info for the player at index i
				printf(_T("    %s\n"), SBServerGetPlayerStringValue(server, i, _T("player"), defaultString));
				printf(_T("      Score: %d\n"), SBServerGetPlayerIntValue(server, i, _T("score"), defaultInt));
				printf(_T("      Deaths: %d\n"), SBServerGetPlayerIntValue(server, i, _T("deaths"), defaultInt));
				printf(_T("      Team (0=Red/1=Blue): %d\n"), SBServerGetPlayerIntValue(server, i, _T("team"), defaultInt));
				printf(_T("      Ping: %d\n"), SBServerGetPlayerIntValue(server, i, _T("ping"), defaultInt));

			}
			// print team info (team name and team score)
			printf(_T("  Teams (Score):\n"));
			for(i = 0; i < SBServerGetIntValue(server, _T("numteams"), 0); i++) 
			{
				printf(_T("    %s (%d)\n"), SBServerGetTeamStringValue(server, i, _T("team"), defaultString),
					     SBServerGetTeamIntValue(server, i, _T("score"), defaultInt));
			}
		}
		break;
	case sbc_serverupdatefailed:
		printf(_T("Update Failed: %s:%d\n"), anAddress, SBServerGetPublicQueryPort(server));
		break;
	case sbc_updatecomplete: // update is complete; server query engine is now idle (not called upon AuxUpdate completion)
		printf(_T("Server Browser Update Complete\r\n")); 
		UpdateFinished = gsi_true; // this will let us know to stop calling ServerBrowserThink
		break;
	case sbc_queryerror: // the update returned an error 
		printf(_T("Query Error: %s\n"), ServerBrowserListQueryError(sb));
		UpdateFinished = gsi_true; // set to true here since we won't get an updatecomplete call
		break;
	default:
		break;
	}

	GSI_UNUSED(instance);
}

// callback triggered by ACE
static void SBConnectCallback(ServerBrowser serverBrowser, SBConnectToServerState state, SOCKET gamesocket, struct sockaddr_in *remoteaddr, void *instance)
{
    struct sockaddr_in saddr;
    socklen_t namelen = sizeof(saddr);
    if (gamesocket != INVALID_SOCKET)
    {
        getsockname(gamesocket, (struct sockaddr *)&saddr, &namelen);
        printf("|Local game socket: %d\n", ntohs(saddr.sin_port));
    }    
    
    // success - we have connected to our QR2 host server
    if (state == sbcs_succeeded)
    {
        printf("Connected to server, remoteaddr: %s, remoteport: %d\n", 
            (remoteaddr == NULL) ? "" : inet_ntoa(remoteaddr->sin_addr), 
            (remoteaddr == NULL) ? 0 : ntohs(remoteaddr->sin_port));

        // copy off the socket and addr to send replies to the game host
        connected = 1;
        memcpy(&otheraddr, remoteaddr, sizeof(otheraddr));
        sock = gamesocket;
    }
    else if (state == sbcs_failed)
        printf(_T("Failed to connect to server"));     
    
    GSI_UNUSED(serverBrowser);
    GSI_UNUSED(instance);
}

int sb_main(int argc, char **argp)
{
	ServerBrowser sb;  // server browser object initialized with ServerBrowserNew

	/* ServerBrowserNew parameters */
	int version = 0;           // ServerBrowserNew parameter; set to 0 unless otherwise directed by GameSpy
	int maxConcUpdates = 20;	// max number of queries the ServerBrowsing SDK will send out at one time
	SBBool lanBrowse = SBFalse;   // set true for LAN only browsing
	void * userData = NULL;       // optional data that will be passed to the SBCallback function after updates

	/* ServerBrowserUpdate parameters */
	SBBool async = SBTrue;     // we will run the updates asynchronously
	SBBool discOnComplete = SBTrue; // disconnect from the master server after completing update 
	                                // (future updates will automatically re-connect)
	// these will be the only keys retrieved on server browser updates
	unsigned char basicFields[] = {HOSTNAME_KEY, GAMETYPE_KEY,  MAPNAME_KEY, NUMPLAYERS_KEY, MAXPLAYERS_KEY};
	int numFields = sizeof(basicFields) / sizeof(basicFields[0]);
	gsi_char serverFilter[100] = {'\0'};  // filter string for server browser updates

	/* ServerBrowserSort parameters */
	SBBool ascending = SBTrue;        // sort in ascending order
	gsi_char * sortKey = _T("ping"); // sort servers based on ping time
	SBCompareMode compareMode = sbcm_int;  // we are sorting integers (as opposed to floats or strings)

	/* ServerBrowserAuxUpdateServer parameter */
	SBBool fullUpdate = SBTrue;

	GSIACResult result;	// used for backend availability check
	int i; // for-loop counter
	SBServer server; // used to hold each server when iterating through the server list
	int totalServers; // keep track of the total number of servers in our server list
	gsi_char * defaultString = _T(""); // default string for SBServerGet functions - returns if specified string key is not found
    gsi_time startTime = 0; 
    SBError error = sbe_noerror;
    unsigned long lastsendtime = 0; // timer used with ACE to send data to connected clients every 2 seconds

	// check that the game's backend is available
	GSIStartAvailableCheck(GAME_NAME);
	while((result = GSIAvailableCheckThink()) == GSIACWaiting)
		msleep(5);
	if(result != GSIACAvailable)
	{
		printf(_T("The backend is not available\n"));
		return 1;
	}
	
	printf(_T("Creating server browser for %s\n\n"), GAME_NAME);
	// create a new server browser object
	sb = ServerBrowserNew (GAME_NAME, GAME_NAME, GAME_KEY, version, maxConcUpdates, QVERSION_QR2, lanBrowse, SBCallback, userData);

/** Populate the server browser's server list by doing an Update **/
	printf(_T("Starting server browser update\n"));
	// begin the update (async)
	int nError = ServerBrowserUpdate(sb, async, discOnComplete, basicFields, numFields, serverFilter);
	if(nError)
	{
		printf("ServerBrowserUpdate Error 0x%x\n", nError);
		return nError;
	}
	
	// think while the update is in progress
	while ((ServerBrowserThink(sb) == sbe_noerror) && (UpdateFinished == gsi_false))
		msleep(10);  // think should be called every 10-100ms; quicker calls produce more accurate ping measurements
/** End Update **/

/** Sort the server list by ping time in ascending order **/
	printf(_T("\nSorting server list by ping\n"));
	// sorting is typically done based on user input, such as clicking on the column header of the field to sort
	ServerBrowserSort(sb, ascending, sortKey, compareMode); 

	totalServers = ServerBrowserCount(sb); // total servers in our server list
	if (totalServers == 0)
		printf("There are no %s servers running currently\n", GAME_NAME);
	else 
	{
		printf("Sorted list:\n");
		// display the server list in the new sorted order
		for(i = 0; i < totalServers; i++)
		{
			server = ServerBrowserGetServer(sb, i);  // get the SBServer object at index 'i' in the server list
			if(!server)
			{
				printf("ServerBrowserGetServer Error!\n");
				return -1;
			}

			// print the server host along with its ping
			printf(_T("  %s  ping: %dms\n"), SBServerGetStringValue(server, _T("hostname"), defaultString), SBServerGetPing(server));
		}
	}
/** End server list sorting **/

/** Refresh the server list, this time using a server filter **/
	printf(_T("\nRefreshing server list and applying a filter: "));
	ServerBrowserClear(sb); // need to clear first so we don't end up with duplicates
	
	printf(_T("US servers with more than 5 players, or servers with a hostname containing 'GameSpy'\n\n"));
    // filter in US servers that have more than 5 players, or any server containing 'GameSpy' in the hostname
	_tcscpy(serverFilter,_T("(country = 'US' and numplayers > 5) or hostname like '%GameSpy%'"));
	// note that filtering by "ping" is not possible, since ping is determined by the client - not the master server

	// begin the update (async)
	nError = ServerBrowserUpdate(sb, async, discOnComplete, basicFields, numFields, serverFilter);
	if(nError)
	{
		printf("ServerBrowserUpdate w/ Filters Error 0x%x\n", nError);
		return nError;
	}

	UpdateFinished = gsi_false; // this was set to true from the last update, so we set it back until the new update completes

	// think once again while the update is in progress
	while ((ServerBrowserThink(sb) == sbe_noerror) && (UpdateFinished == gsi_false)) 
		msleep(10);  
/** End refresh with filter **/

/** If the qr2 sample server is running, we will do an AuxUpdate to retrieve its full keys **/
	printf(_T("\nLooking for GameSpy QR2 Sample server\n"));
	totalServers = ServerBrowserCount(sb); // total servers in our server list
	if (totalServers == 0)
		printf(_T("There are no %s servers running currently\n"), GAME_NAME);
	else 
	{
		int serverFound = 0; // set to 1 if GameSpy QR2 Sample server is in the list

		// iterate through the server list looking for GameSpy QR2 Sample
		for(i = 0; i < totalServers; i++)
		{
			server = ServerBrowserGetServer(sb, i);  // get the SBServer object at index 'i' in the server list
			if(!server)
			{
				printf("ServerBrowserGetServer Error!\n");
				return -1;
			}
			
			// check if the hostname server key is "GameSpy QR2 Sample"
			if (!(_tcscmp(SBServerGetStringValue(server, _T("hostname"), defaultString), _T("GameSpy QR2 Sample")))) 
			{  

				printf(_T("Found it!\n\nRunning AuxUpdate to get more specific server info:\n\n"));
				// update the qr2 sample server object to contain its full keys 
				ServerBrowserAuxUpdateServer(sb, server, async, fullUpdate);
				// Note: Only call this on a server currently in the server list; otherwise call ServerBrowserAuxUpdateIP

				// think once again while the update is in progress; done once the server object has full keys
				while ((ServerBrowserThink(sb) == sbe_noerror) && !(SBServerHasFullKeys(server))) 
					msleep(10);
				
				serverFound = 1;

                // try to connect to server using ServerBrowserConnectToServerWithSocket (ACE)
                sock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
                error = ServerBrowserConnectToServerWithSocket(sb, server, sock, SBConnectCallback);
                if (error)
                {
                    printf(_T("Error found trying to connect to server with ACE\n"));
                }
                else
                {
                    // Enter a wait state while trying to connect - if connected, start sending messages!
                    startTime = current_time();
                    while ((current_time() - startTime) < 40000)
                    {
                        ServerBrowserThink(sb);

                        // w00t we connected to our host - time to start trash talking every 2 seconds!
                        if (connected)
                        {
                            if (current_time() - lastsendtime > 2000)
                            {
                                int ret = sendto(sock, "sup host!?", 10, 0, (struct sockaddr *)&otheraddr, sizeof(struct sockaddr_in));
                                int error = GOAGetLastError(sock);
                                printf("|Sending (%d:%d), remoteaddr: %s, remoteport: %d\n", ret, error, inet_ntoa(otheraddr.sin_addr), ntohs(otheraddr.sin_port));
                                lastsendtime = current_time();
                            }			
                        }
                        if (sock != INVALID_SOCKET)
                            tryread(sock);
                        msleep(10);
                    }
                }

                // cleanup and close our ACE socket
                if (sock != INVALID_SOCKET)
                    closesocket(sock);

                sock = INVALID_SOCKET;
                SocketShutDown();

				break;  // already found the qr2 sample server, no need to loop through the rest 
			}
		}
		if (serverFound == 0)
			printf(_T("Gamespy QR2 Sample server is not running\n"));
	}
/** End AuxUpdate **/

	ServerBrowserFree(sb); // clean up

	// keep program window open until manually exited
#if defined(_WIN32)
	printf(_T("\nPress any key to exit"));
	i = 1;
	while (i)
	{
		msleep(10);
		if (_kbhit())
			break;
	}
#else // all non-windows platforms
	printf(_T("\nProgram is done and will loop indefinitely until killed"));
	i = 1;
	while (i)
		msleep(10);
#endif

	GSI_UNUSED(argc);
	GSI_UNUSED(argp);

	// Finished
	return 0;
}

#ifdef GSI_COMMON_DEBUG
    static void DebugCallback(GSIDebugCategory theCat, GSIDebugType theType,
                              GSIDebugLevel theLevel, const char * theTokenStr,
                              va_list theParamList)
    {
        GSI_UNUSED(theLevel);

        printf("[%s][%s] ",
            gGSIDebugCatStrings[theCat],
            gGSIDebugTypeStrings[theType]);

#endif
    vprintf(theTokenStr, theParamList);
}

// Common entry point
int main(int argc, char** argp)
{
    int ret = 0;
    // set up memanager
    // void *heap = gsiMemManagedInit();

    #ifdef GSI_COMMON_DEBUG
        // Set up debugging
        gsSetDebugCallback(DebugCallback);
        gsSetDebugLevel(GSIDebugCat_All, GSIDebugType_All, GSIDebugLevel_Verbose);
    #endif

    // ret = natneg_main(argc, argp);
    ret = sb_main(argc, argp);

    // gsiMemManagedClose(heap);

    return ret;
}
