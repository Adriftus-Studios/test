compass_tracker:
    type: item
    material: compass
    display name: <yellow>Compass Tracker
    lore:
    - "<green>Used To Track Player
    - Use /track (player) To Find Player

locater:
    type: world
    events:
        on player right clicks block with:compass_tracker:
        - define player <server.match_player[<context.args.get[1]>].if_null[null]>
        - compass <[player].location>