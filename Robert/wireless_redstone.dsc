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
            - narrate "<&a> Location Linked to <context.loction.simple>"
            - determine cancelled
        - else:
            - stop

activate_location_task:
    type: task
    script:
        - modifyblock <context.location.flag[update_location]> redstone_block
