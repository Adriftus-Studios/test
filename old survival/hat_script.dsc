cosmetic_hat_script:
  type: world
  debug: false
  events:
    on player clicks in player slot:40 with:item_flagged:hat:
      - ratelimit <player> 2t
      - if <context.cursor_item.is_truthy>:
        - take cursoritem quantity:<context.cursor_item.quantity>
        - wait 1t
        - equip helmet:<context.cursor_item>
    on player shift_left clicks item_flagged:hat in player:
      - if <player.equipment.get[4].material.name.equals[air]>:
        - equip helmet:<context.item>
        - determine air
