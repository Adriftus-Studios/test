custom_death_message:
    type: world
    debug: false
    events:
        on player dies:
            - define location <context.entity.location>
            - flag <context.entity> respawn:<[location]>
            - determine "<yellow>You were killed by <green><context.damager.name>.<yellow> Cause - <green><context.cause.to_lowercase>"
        on player respawns flagged:respawning:
            - narrate "<gold>You died at <player.flag[respawning].x.round>, <player.flag[respawning].y.round>,<player.flag[respawning].z.round>"
            - narrate "<yellow>You can do /back to teleport back to where you last died."
            - flag <player> respawn:!