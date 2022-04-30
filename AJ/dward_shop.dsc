dwarf_shop_events:
  type: world
  debug: false
  data:
    shop:
      rotating:
        items:
        - TODO
        slots:
        - TODO
  events:
    on player clicks in dwarf_shop_inventory:
    - stop if:<context.clicked_inventory.equals[<player.inventory>]>
    - narrate <context.slot>

dwarf_shop_inventory:
  type: inventory
  inventory: chest
  size: 54
  slots:
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
