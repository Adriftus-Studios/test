custom_death_message:
    type: world
    debug: false
    events:
        on player dies:
            - define location <player.location>
            - determine "You were killed by <context.damager>. Cause - <context.cause.to_lowercase>"
            - narrate "You died at <[location].x.round>,<[location].y.round>,<[location].z.round>"
            - narrate "You can do /back to return to where you last died."