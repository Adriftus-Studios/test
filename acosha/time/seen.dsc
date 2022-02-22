command_playtime:
  type: command
  name: playtime
  description: Used to find Playtime of player
  usage: /playtime (Name)
  script:
  - define player <server.match_player[<context.args.get[1]>].if_null[null]>
  - if <context.args.size> < 1:
      - narrate "<red><bold>Please Use A Player Name"
      - stop
  - if <[player]> = null:
    - narrate "<red><bold>Please Use A Actual Name"
    - stop
  - else:
    - narrate "<light_purple><bold><[player].name> Has <duration[<[player].statistic[PLAY_ONE_MINUTE]>t].in_hours.round> Hours Of Playtime."



