command_playtime:
  type: command
  name: playtime
  description: Used to find Playtime of player
  usage: /playtime (Name)
  script:
  - if <context.args.size> < 1:
      - narrate "Please Use A Player Name"
  - define player <server.match_player[<context.args.get[1]>]>
  - else <[player]> != null:
    - narrate "<light_purple><[player].name> has <duration[<[player].statistic[PLAY_ONE_MINUTE]>t].in_hours.round> hours of playtime."



