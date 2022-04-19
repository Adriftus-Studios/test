teleport_bow:
    type: item
    debug: false
    material: bow
    display name: <yellow><bold>Teleport bow
    lore:
        - <italic><white>Teleports you to wherever you hit.
    mechanisms:
        custom_model_data: 694205

teleporting_using_bow:
    type: world
    debug: false
    events:
        on player shoots teleport_bow:
            - teleport <player> <context.projectile.location>