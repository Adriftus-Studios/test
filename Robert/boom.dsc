boom_command:
    type: command
    name: boom
    debug: false
    description: Creats an explosion at players location
    usage: /boom (player)
    tab completions:
        1: <server.online_players.parse[name]>
    script:
    - define target <server.match_player[<context.args.first>].if_null[null]>
    - define location <[target].location>
    - if <context.args.size> == 0:
        - explode power:5 <player.location>
        - stop
    - if !<[target]> == null:
        - narrate "<&color[#010000]>Unknown Player<&co> <context.args.first>, dumbass"
        - stop
    - else:
        - explode power:5 <[location]>