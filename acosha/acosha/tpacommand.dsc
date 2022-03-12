
tpa_command:
    type: command
    name: tpa
    description: Used To Request A Teleport
    usage: /tpa (name)
    script:
       - if <context.args.size> < 1:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
       - define player <server.match_player[<context.args.get[1]>].if_null[null]>
       - if <[player]> = null:
            - narrate "<red><bold>This Is Not A Player"
            - stop
       - else:
            - teleport <player> <[player].location>
            - narrate "<green>You have Teleported to <[player].name>"


