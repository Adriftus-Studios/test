playtime:
    type: command
    name: playtime
    description: Used To find PLaytime of player
    usage: /playtime (Name)
    script:
        - narrate "<light_purple><player.name> Has <duration[<player.statistic[PLAY_ONE_MINUTE]>t].in_hours.round> Hours Of Playtime"
        - narrate "Nice "
magic_support_bell:
    type: world
    events:
        after player right clicks block:
        - narrate "Your cool"
