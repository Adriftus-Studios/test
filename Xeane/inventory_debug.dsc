inventory_debug:
  type: world
  debug: false
  events:
    on player clicks item in inventory flagged:inventory_debug:
      - narrate "context.item<&co> <context.item>"
      - narrate "context.inventory<&co> <context.inventory>"
      - narrate "context.clicked_inventory<&co> <context.clicked_inventory>"
      - narrate "context.cursor_item<&co> <context.cursor_item>"
      - narrate "context.slot_type<&co> <context.slot_type>"
      - narrate "context.slot<&co> <context.slot>"
      - narrate "context.raw_slot<&co> <context.raw_slot>"
      - narrate "context.action<&co> <context.action>"
      - narrate "context.hotbar_button<&co> <context.hotbar_button>"
      - narrate "<player.open_inventory.slot[6]>"
