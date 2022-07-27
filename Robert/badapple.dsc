bad_apple_item:
    type: item
    debug: false
    material: golden_apple
    display name: <aqua>Golden Apple

bad_apple_command:
    type: command
    name: badapple
    debug: false
    description: bad apple command
    usage: /badapple [player]
    tab completions:
        1: <server.online_players.parse[name]>
    script:
    - define target <server.match_player[<context.args.first>].if_null[null]>
    - if <context.args.size> == 0:
        - give bad_apple_item to:<player.inventory>
        - stop
    - if !<[target]> == null:
        - narrate "<&color[#010000]>Unknown Player<&co> <context.args.first>, dumbass"
        - stop
    - else:
        - give bad_apple_item to:<[target].inventory>

bad_apple_consumed:
    type: world
    debug: false
    events:
        after player consumes bad_apple_item:
        - kill <player>