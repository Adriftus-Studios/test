reset_worldborder:
    type: command
    debug: false
    name: reset_world_border
    description: Resets the world border for the player.
    usage: /reset_world_border
    aliases:
        - rwb
    permissions: adriftus.worldborder.reset
    permission message: <red><bold>Access denied.
    script:
        - worldborder <player> reset
        - narrate "<bold><yellow>The world border has been reset.<reset>"
#Works