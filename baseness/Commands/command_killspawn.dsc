Killspawn:
    type: command
    debug: false
    name: Killspawn
    description: Instantly kills a player and respawns them back to the same location.
    usage: /killspawn <&lt>player<&gt>
    aliases:
        - ks
    tab completion:
        1: <server.online_players.parse[name]>
    script:
        - if <context.args.size> > 1:
            - narrate "<red>Too many arguments!"
            - stop
        #instant kill then forced respawn
        - define player <server.match_player[<context.args.get[1]>]>
        - define player <player> if:<context.args.size.is_less_than[1]>
        - flag <[player]> killspawn:<[player].location>
        - kill <[player]>
        - adjust <[player]> respawn:true
        - teleport <[player]> <[player].flag[killspawn]>
        - flag <[player]> killspawn:!
# Should be able to affect multiple people