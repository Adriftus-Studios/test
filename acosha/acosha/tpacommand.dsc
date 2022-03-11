
tpa_command:
    type: command
    name: tpa
    description: Used To Request A Teleport
    usage: /tpa (name)
    script:
       - if <context.args.size> < 1:
            - narrate "<red><bold>This Player Is Not A Player"
            - stop
       - define player <server.match_player[<context.args.get[1]>].if_null[null]>
       - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
       - else:
            - wait 3s
            - narrate "<green>3"
            - narrate "<green>2"
            - narrate "<green>1"
            - teleport <[player]>
            - narrate "You have Teleported to <[player]>"


