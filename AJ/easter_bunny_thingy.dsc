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
  - foreach <script[easter_bunny_shop_items].list_keys[categories.<[category]>.items]> as:item:
    - define icon <item[easter_bunny_shop_sub_menu_icon]>
    - define icon <[icon].with[display_name=<script[easter_bunny_shop_items].data_key[categories.<[category]>.item.<[item]>.icon.display<&sp>name].parsed.parse_color>]>
    - define icon <[icon].with[material=<script[easter_bunny_shop_items].data_key[categories.<[category]>.item.<[item]>.icon.material].parsed.parse_color>]>
    - give <[icon]> to:<[inv]> quantity:1
  - inventory open d:<[inv]>

easter_bunny_shop_events:
  type: world
  debug: false
  events:
    on player clicks easter_bunny_shop_main_menu_icon in easter_bunny_shop_main_menu:
    - narrate TODO

easter_bunny_shop_items:
  type: data
  categories:
    titles:
      icon:
        material: name_tag
        display name: &eTitles
      items:
        title_unlock_EasterHunt:
          icon:
            material: name_tag
            display name: <yaml[titles].read[titles.EasterHunt.tag]>
            lore:
            - <yaml[titles].read[titles.EasterHunt.description].parsed.parse_color>
          price: 200
          task:
          - run titles_unlock def:EasterHunt|<player>