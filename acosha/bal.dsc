bal_command:
  type: command
  name: bal
  description: Used to change gamemode adventure
  usage: /bal (Name)
  debug: false
  script:
    - if <context.args.size> < 1 && !<Player.has_permission[adriftus.staff.gms]>:
        - narrate "Player has <player.money>"
    - else
        - narrate "Player has <player.money>"