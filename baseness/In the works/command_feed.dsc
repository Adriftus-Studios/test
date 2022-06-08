feed_player_command:
    type: command
    debug: false
    name: feed
    usage: /feed (player) (amount in points) (saturation level)
    description: Feeds player.
    tab completion:
        1: <server.online_players.parse[name]>
        #2nd argument is points
        #3rd argument is saturation
    script:
        - if <context.args.get[1].contains[<server.online_players.parse[name]>]>:
            - feed <context.args.get[1]>
        - if <context.args.get[1]> != <player.name>:
            - feed <context.args.get[1]>