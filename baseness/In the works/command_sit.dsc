sit_down:
    type: command
    debug: false
    name: Sit
    description: Makes the player sit down on a block.
    usage: /sit
    script:
        - stop if:<player.location.below[1].material.name.ends_with[stairs].not.if_null[true]>
        - stop if:<context.location.material.half.equals[BOTTOM].not>
        - determine passively cancelled
        - spawn arrow <player.location.center.below[0.5]> save:mount_point
        - define point <entry[mount_point].spawned_entity>
        - invisible <[point]>
        - flag <[point]> sit.offset:<[point].location.sub[<player.location>]>
        - adjust <[point]> passenger:<player>
#In case of a glitch (likely on the second attempt), kick yourself.

chair_sit_events:
    type: world
    debug: false
    events:
        on player right clicks block:
            - stop if:<context.location.material.name.ends_with[stairs].not.if_null[true]>
            - stop if:<context.location.material.half.equals[BOTTOM].not>
            - determine passively cancelled
            - spawn arrow <context.location.center.below[0.5]> save:mount_point
            - define point <entry[mount_point].spawned_entity>
            - invisible <[point]>
            - flag <[point]> sit.offset:<[point].location.sub[<player.location>]>
            - adjust <[point]> passenger:<player>
# - Made by AJ
# - To be tweaked into a sit command for a block below me