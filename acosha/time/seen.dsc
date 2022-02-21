command_playtime:
  type: command
  name: playtime
  description: Used to find Playtime of player
  usage: /playtime (Name)
  script:
  - define player <server.match_player[<context.args.get[1]>]>
  - if <context.args.size> < 1:
      - narrate "Please Use A Player Name"
  - else <[player]> != null:
    - define player <server.match_player[<context.args.get[1]>]>
    - narrate "<light_purple><[player].name> has <duration[<[player].statistic[PLAY_ONE_MINUTE]>t].in_hours.round> hours of playtime."



