bal_command:
  type: command
  name: bal
  description: Used to change gamemode adventure
  usage: /bal (Name)
  debug: false
  script:
  - if <context.args.size> < 1:
        - narrate "<Player.name> has <player.money>"
        - stop
  - define player <server.match_player[<context.args.get[1]>].if_null[null]>
  - if <[player]> = null:
    - narrate "<red><bold>Please Use A Name Who is Online"
    - stop
  - else:
    - if <Player.has_permission[adriftus.staff]>:
      - narrate "<player.name> has <[player].money>"
