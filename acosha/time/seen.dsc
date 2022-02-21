command_playtime:
  type: command
  name: playtime
  description: Used to find Playtime of player
  usage: /playtime (Name)
  script:
  - define player <server.match_player[<context.args.get[1]>]>
  - if <[player]> != null:
    - narrate "<light_purple><[player].name> has <duration[<[player].statistic[PLAY_ONE_MINUTE]>t].in_hours.round> hours of playtime."
  - else:
    - narrate "Please Insert Somone Online"
    - stop


