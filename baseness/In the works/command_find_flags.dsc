find_player_flag:
    type: command
    debug: false
    name: Find_player_flag
    description: Narrates a list of the target player's flags
    usage: /find_player_flag (player)
    aliases:
        - fpf
    tab completions:
        1: <server.online_players.parse[name]>
    script:
        - define player <context.args.get[1]>
        - if !<context.args.get[1].is_online>:
            - narrate <server.match_offline_player[<[player]>].list_flags.separated_by[<&nl>]> targets:<player>
        - else:
            - narrate <server.match_offline_player[<[player]>].list_flags.separated_by[<&nl>]> targets:<player>
        #server.match_offline_player[<[player]>]||