easter_bunny_open_shop:
  type: task
  definitions: player|category
  debug: false
  script:
  - define inv <inventory[easter_bunny_shop_inventory]>
  - inventory open d:<[inv]> player:<[player]>

easter_bunny_shop_main_menu_icon:
  type: item
  material: cobblestone

easter_bunny_shop_main_menu:
  type: inventory
  inventory: chest
  size: 54
  title: easter_bunny_shop_main_menu
  gui: true
  definitions:
    f: <item[standard_filler]>
  slots:
  - [f] [f] [f] [f] [f] [f] [f] [f] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [f] [f] [f] [f] [f] [f] [f] [f]

easter_bunny_shop_main_menu_open:
  type: task
  debug: false
  definitions: player
  script:
  - adjust <queue> linked_player:<[player]> if:<[player].object_type.equals[Player].if_null[false]>
  - define inv <inventory[easter_bunny_shop_main_menu]>
  - foreach <script[easter_bunny_shop_items].list_keys[categories]> as:cat:
    - define icon <item[easter_bunny_shop_main_menu_icon]>
    - define icon <[icon].with[display_name=<script[easter_bunny_shop_items].data_key[categories.<[cat]>.icon.display<&sp>name].parsed.parse_color>]>
    - define icon <[icon].with[material=<script[easter_bunny_shop_items].data_key[categories.<[cat]>.icon.material].parsed.parse_color>]>
    - give <[icon]> to:<[inv]> quantity:1
  - inventory open d:<[inv]>

easter_bunny_shop_sub_menu_icon:
  type: item
  material: cobblestone

easter_bunny_shop_sub_menu:
  type: inventory
  inventory: chest
  size: 54
  title: easter_bunny_shop_sub_menu
  gui: true
  definitions:
    f: <item[standard_filler]>
  slots:
  - [f] [f] [f] [f] [f] [f] [f] [f] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [f] [f] [f] [f] [f] [f] [f] [f]

easter_bunny_shop_sub_menu_open:
  type: task
  debug: false
  definitions: category|player
  script:
  - adjust <queue> linked_player:<[player]> if:<[player].object_type.equals[Player].if_null[false]>
  - define inv <inventory[easter_bunny_shop_sub_menu]>
  - if <[category]> == titles:
    - foreach <script[easter_bunny_shop_items].list_keys[categories.<[category]>.items]> as:item:
      - define icon <item[easter_bunny_shop_sub_menu_icon]>
      - define material <script[easter_bunny_shop_items].data_key[categories.<[category]>.items.<[item]>.icon.material].parsed.parse_color>
      - define lore <script[cosmetic_configuration].data_key[display_data.lore]>
      - define icon <[icon].with[material=<[material]>]>
      - define icon <[icon].with[lore=<[lore]>]> if:<[lore].equals[null].not>
      - give <[icon]> to:<[inv]> quantity:1
  - inventory open d:<[inv]>

easter_bunny_shop_events:
  type: world
  debug: false
  events:
    on player clicks easter_bunny_shop_main_menu_icon in easter_bunny_shop_main_menu:
    - narrate TODO