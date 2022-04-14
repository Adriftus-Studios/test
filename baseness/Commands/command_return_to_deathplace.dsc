return_to_deathplace:
    type: command
    debug: false
    name: Back
    description: Go back to where you last died.
    usage: /back
    script:
        - teleport <player> <player.flag[last_died]>
        - narrate "<yellow><bold>You have been teleported to where you last died."