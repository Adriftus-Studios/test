feed_player_command:
    type: command
    debug: false
    name: feed
    usage: /feed (player) (amount in points) (saturation level)
    description: Feeds player.
    tab completion:
        1: <server.online_players.parse[name]>
    script:
        - if <context.args.get[1].contains[<server.online_players.parse[name]>]>:
            - feed <context.args.get[1]>