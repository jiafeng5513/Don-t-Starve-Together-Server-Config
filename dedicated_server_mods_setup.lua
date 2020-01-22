--There are two functions that will install mods, ServerModSetup and ServerModCollectionSetup. Put the calls to the functions in this file and they will be executed on boot.
 
--ServerModSetup takes a string of a specific mod's Workshop id. It will download and install the mod to your mod directory on boot.
    --The Workshop id can be found at the end of the url to the mod's Workshop page.
    --Example: http://steamcommunity.com/sharedfiles/filedetails/?id=350811795
    --ServerModSetup("350811795")
 
--ServerModCollectionSetup takes a string of a specific mod's Workshop id. It will download all the mods in the collection and install them to the mod directory on boot.
    --The Workshop id can be found at the end of the url to the collection's Workshop page.
    --Example: http://steamcommunity.com/sharedfiles/filedetails/?id=379114180
    --ServerModCollectionSetup("379114180")
 ServerModSetup("374550642")     
 ServerModSetup("362175979")
 ServerModSetup("375859599")
 ServerModSetup("375850593")
 ServerModSetup("347079953")
 ServerModSetup("378160973")
 ServerModSetup("501385076") 
 ServerModSetup("632082897") 
 ServerModSetup("656256171")
 ServerModSetup("666155465")
 ServerModSetup("1301033176")
 ServerModSetup("1499637833")
 ServerModSetup("378962221")
 ServerModSetup("623749604")
 ServerModSetup("458940297")
--ServerModCollectionSetup("id")
