hyperion:
    type: item
    material: iron_sword
    display name: <yellow>Hyperion

hyperionteleport:
    type: world
    events:
        on player right clicks block with:hyperion:
            - teleport <player> <player.location.forward[5]>
            - explode power:3 