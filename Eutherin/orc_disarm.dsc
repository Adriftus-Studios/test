orc_disarm_command:
  type: command
  name: orcdisarm
  usage: /orcdisarm player
  description: drops the players held item
  Permission: adriftus.admin
  script:
    - if <server.match_player[<context.args.get[1]>]||null> != null && <server.match_player[<context.args.get[1]>].item_in_hand||null> != null:
      - define item <server.match_player[<context.args.get[1]>].item_in_hand>
      - take <player.item_in_hand>
      - wait 10t
      - drop <[item]>
