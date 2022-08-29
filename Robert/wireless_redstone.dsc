wireless_activater_item:
    type: item
    material: redstone_torch
    display name: <reset>Wireless Activater
    flags:
        on_place: set_location_task
        right_click_script: activate_location_task

set_location_task:
    type: task
    script:
        - if <player.is_sneaking>:
            - inventory flag slot:<player.held_item_slot> update_location:<context.location>
            - narrate "<&a> Location Linked to <context.location.simple>"
            - define location <context.item_in_hand.flag[update_location]>
            - determine cancelled
        - else:
            - determine cancelled

activate_location_task:
    type: task
    script:
        - define location <player.item_in_hand.flag[update_location]>
        - if <[location].material.switched>:
            - modifyblock <[location]> redstone_block
            - showfake air <[location]> players:<server.online_players> d:-214748364