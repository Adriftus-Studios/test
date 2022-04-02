compass_tracker:
    type: item
    material: compass
    display name: <yellow>Compass Tracker
    lore:
    - "<green>Used To Track Player
    - Use /track (player) To Find Player

locater:
    type: command
    name: track
    description: Used To track player
    usage: /track (player)
    script:
        - define player <server.match_player[<context.args.get[1]>].if_null[null]>
        - compass <[player].location>