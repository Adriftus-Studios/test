death_log_handler:
    type: world
    debug: false
    events:
        on player dies:
            - flag <player> death_log:->:<context.location.formatted>

death_log_command:
    type: command
    debug: false
    name: deathlog
    usage: /deathlog <&lt>player<&gt>
    aliases:
        - /dl
    description: Displays a death log of the last 40 deaths of a player.
    script:
        - narrate "<player.name>'s last 40 deaths:"
        - foreach <player.flag[death_log]> as:dl:
            - narrate <[dl]>