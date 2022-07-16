bal_command:
  type: command
  name: balence
  description: Used to change gamemode adventure
  usage: /balence (Name)
  debug: false
  aliases:
  - bal
  script:
  - if !<player.has_permission[adriftus.staff]> || <context.args.is_empty>:
        - narrate "<Player.name> has <player.money>"
        - stop
  - else:
        - define player <server.match_player[<context.args.first>].if_null[null]>
        - narrate "<[Player].name> has <[player].money>"
        - stop
  - if <[player]> == null:
    - narrate "<red><bold>Please Use A Name Who is Online"
    - stop

