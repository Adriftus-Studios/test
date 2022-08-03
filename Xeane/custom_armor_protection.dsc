custom_armor_protection:
  type: world
  debug: false
  events:
    on player leather_* recipe formed:
      - if <context.item.color.blue> == 253:
        - determine <context.item.with[color=<context.item.color.with_blue[255]>]>