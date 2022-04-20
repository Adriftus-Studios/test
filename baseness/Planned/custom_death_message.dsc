custom_death_message:
    type: world
    debug: false
    events:
        on player dies:
            - define location <context.entity.location>
            - determine "<yellow>You were killed by <green><context.damager.name>.<yellow> Cause - <green><context.cause.to_lowercase>"
            - determine "You died at <[location].x.round>,<[location].y.round>,<[location].z.round>" targets:<context.entity>
            - determine "You can do /back to return to where you last died." targets:<context.entity>