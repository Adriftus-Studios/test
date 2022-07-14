turn_command:
    type: command
    name: turn
    debug: false
    description: Creats an explosion at players location
    usage: /turn (player)
    tab completions:
        1: <server.online_players.parse[name]>
    script:
    - define target <server.match_player[<context.args.first>].if_null[null]>
    - if <context.args.size> == 0:
        - rotate <player> yaw:9 pitch:0 duration:1s
        - stop
    - if !<[target]> == null:
        - narrate "<&color[#010000]>Unknown Player<&co> <context.args.first>, dumbass"
        - stop
    - else:
        - rotate <[target]> yaw:9 pitch:0 duration:1s