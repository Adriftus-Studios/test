bal_command:
  type: command
  name: balance
  description: Used to change gamemode adventure
  usage: /balance (Name)
  debug: false
  aliases:
  - bal
  script:
  - if !<player.has_permission[adriftus.staff]> || <context.args.is_empty>:
        - narrate "<green>You have <player.money> coins"
        - stop
  - define player <server.match_player[<context.args.first>].if_null[null]>
  - else if <[player]> == null::
        - narrate "<red><bold>Please Use A Name Who is Online"
        - stop
  - else
        - narrate "<green><[Player].name.to_uppercase> has <[player].money> coins"
        - stop


