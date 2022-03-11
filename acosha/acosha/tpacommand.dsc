
tpa_command:
    type: command
    name: tpa
    description: Used To Request A Teleport
    usage: /tpa (name)
    script:
       - if <context.args.size> < 1:
            - narrate "<green> This Player Is Not A Player"
            - stop
       - define player <server.match_player[<context.args.get[1]>].if_null[null]>
       - teleport <[player]>
    


