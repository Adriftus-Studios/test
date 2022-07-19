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
    - define title_string:|:<&chr[F808]><&chr[2000]>
    - define title_string:|:<&chr[F701]><&chr[2101]><&chr[F801]><&chr[2001]><&chr[F601]><&chr[2102]><&chr[F801]><&chr[2002]>
    - define title_string:|:<&chr[F702]><&chr[2103]><&chr[F801]><&chr[2003]><&chr[F601]><&chr[2104]><&chr[F801]><&chr[2004]>
    - define title_string:|:<&chr[F702]><&chr[2105]><&chr[F801]><&chr[2005]><&chr[F601]><&chr[2106]><&chr[F801]><&chr[2006]>
    - define title_string:|:<&chr[F702]><&chr[2107]><&chr[F801]><&chr[2007]><&chr[F601]><&chr[2108]><&chr[F801]><&chr[2008]>
    - adjust <[inventory]> title:<&f><&font[adriftus:travel_menu]><[title_string].unseparated>
    - inventory open d:<[inventory]>