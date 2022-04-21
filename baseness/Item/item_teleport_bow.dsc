teleport_bow:
    type: item
    debug: false
    material: bow
    display name: <yellow><bold>Teleport bow
    lore:
        - <italic><white>Teleports you to wherever you hit.
    mechanisms:
        custom_model_data: 694205

teleport_bow_function:
    type: world
    debug: false
    events:
        on player shoots teleport_bow:
            - if <context.shooter.item_in_hand.custom_model_data> == 694205:
                - teleport <player> <context.projectile>