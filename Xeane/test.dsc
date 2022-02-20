# aj_test_events:
#     type: world
#     debug: false
#     events:
#         on player damages player ignorecancelled:true bukkit_priority:MONITOR:
#         - narrate "event 1 fired" targets:<player[AJ_4real]>
#         on player damages player ignorecancelled:true:
#         - narrate "event 2 fired" targets:<player[AJ_4real]>