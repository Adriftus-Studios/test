playtime:
    type: command
    name: playtime
    description: Used To find PLaytime of player
    usage: /playtime (Name)
    script:
        - narrate "<light_purple><Player.name> Has <duration[<player.statistic[PLAY_ONE_MINUTE]>t].in_hours.round> Hours Of Playtime"