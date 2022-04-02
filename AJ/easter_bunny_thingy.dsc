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
  title: TODO
  definitions:
    f: <item[standard_filler]>
  slots:
  - [f] [f] [f] [f] [f] [f] [f] [f] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [f] [f] [f] [f] [f] [f] [f] [f]

easter_bunny_shop_sub_menu_icon:
  type: item
  material: cobblestone

easter_bunny_shop_sub_menu:
  type: inventory
  inventory: chest
  size: 54
  title: TODO
  definitions:
    f: <item[standard_filler]>
  slots:
  - [f] [f] [f] [f] [f] [f] [f] [f] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [] [] [] [] [] [] [] [f]
  - [f] [f] [f] [f] [f] [f] [f] [f] [f]

easter_bunny_shop_events:
  type: world
  debug: false
  events:
    on player clicks in easter_bunny_shop_main_menu:
    - narrate TODO

easter_bunny_shop_main_menu_open:
  type: task
  debug: false
  definitions: player
  script:
  - adjust <queue> linked_player:<[player]> if:<[player].object_type.equals[Player].if_null[false]>
  - define inv <inventory[easter_bunny_shop_main_menu]>
  - foreach <script[easter_bunny_shop_items].list_keys[categories]> as:cat:
    - define icon <item[easter_bunny_shop_sub_menu_icon]>
    - define icon <[icon].with[display_name=<script[easter_bunny_shop_items].data_key[categories.<[cat]>.icon.display<&sp>name].parsed>]>
    - define icon <[icon].with[material=<script[easter_bunny_shop_items].data_key[categories.<[cat]>.icon.material].parsed>]>
    - give <[icon]> to:<[inv]> quantity:1
  - inventory open d:<[inv]>

easter_bunny_shop_items:
  type: data
  categories:
    titles:
      icon:
        material: name_tag
        display name: <&e>Titles
      items:
        title_unlock_EasterHunt:
          icon:
            material: name_tag
            display name: <yaml[titles].read[titles.EasterHunt.tag]>
            lore:
            - <yaml[titles].read[titles.EasterHunt.description]>
          price: 200
          task:
            name: titles_unlock
            definitions:
              title_id: EasterHunt
              player: <player>
    # cosmetics:
    #   icon:
    #     material: end_crystal
    #     display name: <&e>Cosmetics