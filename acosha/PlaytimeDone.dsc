command_playtime:
  type: command
  name: playtime
  description: Used to find Playtime of player
  usage: /playtime (Name)
  script:
  - if <context.args.size> < 1:
      - narrate "<green><bold><player.name> Has <duration[<player.statistic[PLAY_ONE_MINUTE]>t].in_hours.round> Hours Of Playtime."
      - stop
  - define player <server.match_player[<context.args.get[1]>].if_null[null]>
  - if <[player]> = null:
    - narrate "<red><bold>Please Use A Name Who is Online"
    - stop
  - else:
    - if <Player.has_permission[adriftus.staff]>:
      - narrate "<green><bold><[player].name> Has <duration[<[player].statistic[PLAY_ONE_MINUTE]>t].in_hours.round> Hours Of Playtime."
    - else:
      - narrate "<green><bold><player.name> Has <duration[<player.statistic[PLAY_ONE_MINUTE]>t].in_hours.round> Hours Of Playtime."


