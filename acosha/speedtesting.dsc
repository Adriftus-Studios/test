speed_command:
  type: command
  name: speed
  description: Used to find Playtime of player
  usage: /speed (name) (arg)
  script:
     - if <context.args.size> < 2:
         - narrate "<red>No speed or name choosen"
         - stop
     - else:
         - define speed <context.args.get[2]>
         - define player <server.match_player[<context.args.get[1]>].if_null[null]>
         - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
         - else:
            - adjust <[player]> speed:<[speed]>

