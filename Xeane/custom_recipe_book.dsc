custom_recipe_data_initializer:
  type: world
  debug: false
  data:
    categories:
      travel:
        material: feather
        display: <&a>Travel Items
        lore:
          - "<&e>Items related to getting around"
      tools:
        material: feather
        display: <&a>Tools
        lore:
          - "<&e>Items for getting work DONE!"
      blocks:
        material: feather
        display: <&a>Blocks
        lore:
          - "<&e>Various custom blocks!"
      combat:
        material: feather
        display: <&c>Combat
        lore:
          - "<&e>Stuff to beat your friends!"
          - "<&e>Yea, probably your enemies too"
      gadgets:
        material: feather
        display: <&d>Gadgets
        lore:
          - "<&e>Cool things!"
          - "<&e>Other stuff, too..."
      food:
        material: feather
        display: <&2>Food
        lore:
          - "<&e>FEWD!!!!"
          - "<&e>Nom nom nom"
      brewing:
        material: feather
        display: <&b>Brewing
        lore:
          - "<&e>DRINKS!!!"
          - "<&e>You must be 21+ to click"
      decor:
        material: feather
        display: <&5>Decor
        lore:
          - "<&e>Stuff for the pretty pretty!"
      misc:
        material: feather
        display: <&e>Misc stuff
        lore:
          - "<&e>Lotta random, ngl"
  build_item_list:
    - flag server recipe_book:!
    - foreach <server.scripts.filter[data_key[data.recipe_book_category].exists].parse[name]> as:item_script:
      - if !<[item_script].as_item.recipe_ids.is_empty.if_null[true]>:
        - foreach <[item_script].as_item.recipe_ids> as:recipe_id:
          - define result <item[<[item_script]>]>
          - define items <list>
          - foreach <server.recipe_items[<[recipe_id]>]> as:recipe_item:
            - if <[recipe_item].starts_with[material]>:
              - define recipe_item <[recipe_item].substring[10].as_item>
            - else if <[recipe_item].script.data_key[recipes].exists>:
              - define recipe_item "<item[<[recipe_item]>].with[flag=run_script:custom_recipe_inventory_open;flag=recipe_id:<[recipe_item].as_item.recipe_ids.get[1].after[<&co>]>;lore=<[recipe_item].lore.include[<&b>Click to see Recipe]>]>"
            - else:
              - define value <[recipe_item].as_item>
            - define items:|:<[recipe_item]>
          - define category <[result].script.data_key[data.recipe_book_category]>
          - if !<script.data_key[data.categories].keys.contains[<[category]>]>:
            - debug ERROR "ITEM HAS UNKNOWN CATEGORY<&co> <[category]>"
            - foreach next
          - flag server recipe_book.categories.<[category]>.<[item_script]>:<[recipe_id].after[<&co>]>
          - flag server recipe_book.recipes.<[recipe_id].after[<&co>]>.items:!|:<[items]>
          - flag server recipe_book.recipes.<[recipe_id].after[<&co>]>.result:<[result]>
  events:
    on server start:
      - inject locally path:build_item_list
    on script reload:
      - inject locally path:build_item_list

custom_recipe_inventory_open:
  type: task
  debug: true
  definitions: recipe_id
  data:
    slots: 13|14|15|22|23|24|31|32|33
    result: 26
    back: 20
  script:
    - define recipe_id <context.item.flag[recipe_id]> if:<[recipe_id].exists.not>
    - define recipe_id <[recipe_id]>
    - define inventory <inventory[custom_recipe_inventory]>
    - inventory set slot:<script.data_key[data.result]> d:<[inventory]> o:<server.flag[recipe_book.recipes.<[recipe_id]>.result]>
    - define slots <script.data_key[data.slots].as_list>
    - foreach <server.flag[recipe_book.recipes.<[recipe_id]>.items]>:
      - foreach next if:<[value].material.name.equals[air].if_null[false]>
      - inventory set slot:<[slots].get[<[loop_index]>]> d:<[inventory]> o:<[value]>
    - inventory open d:<[inventory]>

crafting_book_inventory:
  type: inventory
  title: <&f><&font[adriftus:guis]><&chr[F808]><&chr[6915]>
  size: 36
  gui: true
  inventory: chest

crafting_book_category_inventory:
  type: inventory
  title: <&f><&font[adriftus:guis]><&chr[F808]><&chr[6916]>
  size: 36
  gui: true
  inventory: chest

custom_recipe_inventory:
  type: inventory
  title: <&f><&font[adriftus:guis]><&chr[F808]><&chr[6917]>
  size: 36
  gui: true
  inventory: chest

crafting_book_open:
  type: task
  debug: false
  data:
    travel_slots: 11|12
    food_slots: 14|15
    blocks_slots: 17|18
    combat_slots: 20|21
    brewing_slots: 23|24
    decor_slots: 26|27
    tools_slots: 29|30
    gadgets_slots: 32|33
    misc_slots: 35|36
  script:
    - define inventory <inventory[crafting_book_inventory]>
    - foreach <script[custom_recipe_data_initializer].parsed_key[data.categories]> key:category as:values:
      - define item <item[<[values].get[material]>].with[custom_model_data=3;lore=<[values].get[lore]>;display=<[values].get[display]>;flag=run_script:crafting_book_open_category;flag=category:<[category]>]>
      - foreach <script.data_key[data.<[category]>_slots]> as:slot:
        - inventory set slot:<[slot]> o:<[item]> d:<[inventory]>
    - inventory open d:<[inventory]>

crafting_book_open_category:
  type: task
  debug: false
  data:
    slots: 11|12|13|14|15|16|17|20|21|22|23|24|25|26|29|30|31|32|33|34|35
    back_slot: 2
  definitions: category
  script:
    - define category <context.item.flag[category]> if:<[category].exists.not>
    - define inv <inventory[crafting_book_category_inventory]>
    - define slots <script.data_key[data.slots].as_list>
      - inventory set slot:<script.data_key[data.back_slot]> d:<[inv]> "o:feather[custom_model_data=3;display=<&c>Back to Categories;flag=run_script:crafting_book_open]"
    - if <server.has_flag[recipe_book.categories.<[category]>]>:
      - define items <server.flag[recipe_book.categories.<[category]>].keys>
      - foreach <[items]> as:item:
        - inventory set slot:<[slots].get[<[loop_index]>]> o:<item[<[item]>].with[flag=run_script:custom_recipe_inventory_open;flag=recipe_id:<server.flag[recipe_book.categories.<[category]>.<[item]>]>]> d:<[inv]>
    - inventory open d:<[inv]>