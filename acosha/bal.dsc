bal_command:
  type: command
  name: balance
  description: Used to change gamemode adventure
  usage: /balance (Name)
  debug: false
  aliases:
  - bal
  script:
  - define player <server.match_player[<context.args.first>].if_null[null]>
  - if <[player]> == null && <context.args.size> > 1:
        - narrate "<red><bold>Please Use A Name Who is Online"
  - else !<player.has_permission[adriftus.staff]> || <context.args.is_empty>:
        - narrate "<green>You have <player.money> coins"
  - else
        - narrate "<green><[Player].name.to_uppercase> has <[player].money> coins"
        - stop


