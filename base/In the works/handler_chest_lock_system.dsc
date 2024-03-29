chest_lock_item:
    type: item
    debug: false
    material: iron_nugget
    display name: <white><bold>Iron Padlock
    lore:
        - <yellow><bold>Right-click a chest to lock it.

chest_lock_system:
    type: world
    debug: false
    events:
        on player right clicks chest|trapped_chest|barrel with:chest_lock_item:
            - determine passively cancelled
            - if <context.location.has_flag[locked_chest]>:
                - narrate "This chest is already locked."
                - narrate "Owner - <context.location.flag[locked_chest].name>"
                - stop
            - flag <context.location> locked_chest:<player.uuid>
            - if <context.location.other_block.exists>:
                - flag <context.location.other_block> locked_chest:<player.uuid>
        on player right clicks block location_flagged:locked_chest:
            - if <context.location.flag[locked_chest]> != <player.uuid>:
                - determine passively cancelled
                - narrate "This chest belongs to <context.location.flag[locked_chest].as_player.name>."
        on player breaks chest location_flagged:locked_chest:
            - flag <context.location.other_block> locked_chest:!
#Approved
#Issue - Idea isn't very clear