block_properties:
  type: world
  debug: true
  events:
    on player places block location_flagged:no_build:
      - determine cancelled
    on player breaks block location_flagged:on_break:
      - inject <context.location.flag[on_break]>
    on player right clicks block_flagged:infinite_chest:
      - determine passively cancelled
      - inventory open d:<inventory[generic].with[contents=<context.location.inventory.list_contents>]>