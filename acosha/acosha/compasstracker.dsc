

locater_compass:
    type: command
    name: track
    description: Used To track player
    usage: /track (player)
    script:
        - define player <server.match_player[<context.args.get[1]>].if_null[null]>
        - flag <[player]> tracking
        - while <player.has_flag[tracking]> && <player.is_online>:
                - compass <[player].location>
                - wait 5s