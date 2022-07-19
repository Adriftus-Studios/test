calipolis_lore_locations_inventory:
  type: inventory
  debug: false
  inventory: chest
  size: 54
  title: Placeholder
  #gui: true

calipolis_lore_location_tp:
  type: item
  debug: false
  material: feather
  mechanisms:
    custom_model_data: 3

calipolis_lore_locations_open:
  type: task
  debug: false
  data:
    locations:
      - KaluPalu
      - OctoberBay
      - TheCalony
      - LibraryOfCal
      - CelebrationRona
      - SecretSoupSociety
      - CoronationHall
      - ThundersnowPalace
    location_data:
      KaluPalu:
        name: <&6>Kalu Palu
        lore:
          - <&e>One of the last remnants of an era long passed
          - <&e>Though once said to be an ancient people that thrived off the land
          - <&e>only their ruins remain.
      LibraryOfCal:
        name: <&6>Library of Calexandria
        lore:
          - <&e>Knowledge and revelations are abound amongst these shelves
          - <&e>If ever you need answers this is the place to start
    slot_map:
      back: 49
      next_page: 9
      last_page: 1
      slots:
      - 10
      - 15
      - 20
      - 25
      - 30
      - 35
      - 40
      - 45
  definitions: page
  script:
    - define page 1 if:<[page].exists.not>
    - define inventory <inventory[calipolis_lore_locations_inventory]>
    - define title_string:|:<&chr[F808]><&chr[2000]>
    - if <[page]> == 1:
      - define title_string:|:<&chr[F701]><&chr[2101]><&chr[F801]><&chr[2001]><&chr[F601]><&chr[2102]><&chr[F801]><&chr[2002]>
      - define title_string:|:<&chr[F702]><&chr[2103]><&chr[F801]><&chr[2003]><&chr[F601]><&chr[2104]><&chr[F801]><&chr[2004]>
      - define title_string:|:<&chr[F702]><&chr[2105]><&chr[F801]><&chr[2005]><&chr[F601]><&chr[2106]><&chr[F801]><&chr[2006]>
      - define title_string:|:<&chr[F702]><&chr[2107]><&chr[F801]><&chr[2007]><&chr[F601]><&chr[2108]><&chr[F801]><&chr[2008]>
      - adjust <[inventory]> title:<&f><&font[adriftus:travel_menu]><[title_string].unseparated>
    - else if <[page]> == 2:
      - define title_string:|:<&chr[F701]><&chr[2101]><&chr[F801]><&chr[2001]><&chr[F601]><&chr[2102]><&chr[F801]><&chr[2002]>
      - define title_string:|:<&chr[F702]><&chr[2103]><&chr[F801]><&chr[2003]><&chr[F601]><&chr[2104]><&chr[F801]><&chr[2004]>
      - define title_string:|:<&chr[F702]><&chr[2105]><&chr[F801]><&chr[2005]><&chr[F601]><&chr[2106]><&chr[F801]><&chr[2006]>
      - define title_string:|:<&chr[F702]><&chr[2107]><&chr[F801]><&chr[2007]><&chr[F601]><&chr[2108]><&chr[F801]><&chr[2008]>
      - adjust <[inventory]> title:<&f><&font[adriftus:travel_menu]><[title_string].unseparated>
    - define slots <script.data_key[data.slot_map.slots]>
    - foreach <script.data_key[data.locations].get[<[page].sub[1].mul[8].add[1]>].to[<[page].mul[8]>]>:
      - if <script.data_key[data.location_data.<[value]>].exists>:
        - define display <script.data_key[data.location_data.<[value]>.name]>
        - define lore <script.parsed_key[data.location_data.<[value]>.lore]>
        - define item calipolis_lore_location_tp[display=<[display]>;lore=<[lore]>;flags=target:<[value]>]
      - else:
        - define item calipolis_lore_location_tp[display=PLACEHOLDER;lore=PLACEHOLDER;flags=target:<[value]>]
      - inventory set slot:<[slots].get[<[loop_index]>]> o:<[item]> d:<[inventory]>
    - inventory open d:<[inventory]>