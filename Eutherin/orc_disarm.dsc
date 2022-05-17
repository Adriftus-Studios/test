orc_disarm_command:
  type: command
  name: orcdisarm
  usage: /orcdisarm player
  description: drops the players held item
  script:
    - if <server.match_player[<context.arg[1]>].is_spawned> && <server.match_player[<context.arg[1]>].item_in_hand||null> != null:
      - define item <server.match_player[<context.arg[1]>].item_in_hand>
      - define quantity <[item].quantity>
      - take <player.held_item_slot>
      - drop <[item]> quantity:<[quantity]>
