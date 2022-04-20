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
        on arrow hits block:
            - if <context.shooter.item_in_hand> == teleport_bow:
                - teleport <player> <context.projectile>