calipolis_lore_locations_inventory:
  type: inventory
  debug: false
  inventory: chest
  size: 54
  title: Placeholder
  gui: true

calipolis_lore_locations_open:
  type: task
  debug: false
  data:
    locations:
      - Kalu-Palu
      - OctoberBay
      - TheCalony
  script:
    - define inventory <inventory[calipolis_lore_locations_inventory]>
    - adjust <[inventory]> title:<&f><&font[adriftus:travel_menu]><&chr[F808]><&chr[2000]><&chr[F701]><&chr[2101]><&chr[2001]><&chr[F601]><&chr[2102]><&chr[2002]><&chr[F702]><&chr[2103]><&chr[2003]>
    - inventory open d:<[inventory]>