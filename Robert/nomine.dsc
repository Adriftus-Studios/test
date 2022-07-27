nomine_command:
    type: command
    name: nomine
    debug: false
    description: Does something
    usage: /nomine (player) (duration)
    tab completions:
        1: <server.online_players.parse[name]>
    script:
    - define target <server.match_player[<context.args.first>].if_null[null]>
    - define duration <context.args.get[2]>
    - if <context.args.size> == 0:
        - if <player.has_flag[nomine]>:
            - flag <player> nomine:!
        - else:
            - flag <player> nomine
        - stop
    - if !<[target]> == null:
        - narrate "<&color[#010000]>Unknown Player<&co> <context.args.first>, dumbass"
        - stop
    - else if <context.args.size> == 1:
        - if <[target].has_flag[nomine]>:
            - flag <[target]> nomine:!
        - else:
            - flag <[target]> nomine
        - stop
    - else if <context.args.size> == 2:
            - flag <[target]> nomine expire:<[duration]>
            - stop
nomine_world:
    type: world
    debug: false
    events:
        on player flagged:nomine breaks block:
            - determine passively cancelled