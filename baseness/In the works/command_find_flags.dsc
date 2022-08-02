find_player_flag:
    type: command
    debug: false
    name: Find_player_flag
    description: Narrates a list of the target player's flags
    usage: /find_player_flag (player)
    aliases:
        - fpf
    tab completions:
        1: <server.online_players[name]>
    script:
        - define player <context.args.get[1]>
        - narrate targets:<player> <server.match_offline_player||server.match_player[<[player]>].list_flags.separated_by[<&nl>]>