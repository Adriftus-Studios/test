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
        material: iron_pickaxe
        display: <&a>Tools
        lore:
          - "<&e>Items for getting work DONE!"
      blocks:
        material: shulker_box
        display: <&a>Blocks
        lore:
          - "<&e>Various custom blocks!"
      combat:
        material: netherite_sword
        display: <&c>Combat
        lore:
          - "<&e>Stuff to beat your friends!"
          - "<&e>Yea, probably your enemies too"
      gadgets:
        material: piston
        display: <&d>Gadgets
        lore:
          - "<&e>Cool things!"
          - "<&e>Other stuff, too..."
      food:
        material: cake
        display: <&2>Food
        lore:
          - "<&e>FEWD!!!!"
          - "<&e>Nom nom nom"
      brewing:
        material: potion
        display: <&b>Brewing
        lore:
          - "<&e>DRINKS!!!"
          - "<&e>You must be 21+ to click"
      decor:
        material: azalea
        display: <&5>Decor
        lore:
          - "<&e>Stuff for the pretty pretty!"
      misc:
        material: paper
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
  script:
    - define recipe_id <context.item.flag[recipe_id]> if:<[recipe_id].exists.not>
    - define recipe_id <[recipe_id]>
    - define inventory <inventory[custom_recipe_inventory]>
    - inventory set slot:1 d:<[inventory]> o:<server.flag[recipe_book.recipes.<[recipe_id]>.result]>
    - foreach <server.flag[recipe_book.recipes.<[recipe_id]>.items]>:
      - foreach next if:<[value].material.name.equals[air].if_null[false]>
      - inventory set slot:<[loop_index].add[1]> d:<[inventory]> o:<[value]>
    - adjust <[inventory]> title:<server.flag[recipe_book.recipes.<[recipe_id]>.result].display>
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
  script:
    - define inventory <inventory[crafting_book_inventory]>
    - foreach <script[custom_recipe_data_initializer].parsed_key[data.categories]> key:category as:values:
      - define item <item[<[values].get[material]>].with[lore=<[values].get[lore]>;display=<[values].get[display]>;flag=run_script:crafting_book_open_category;flag=category:<[category]>]>
      - give <[item]> to:<[inventory]>
    - inventory open d:<[inventory]>

crafting_book_open_category:
  type: task
  debug: false
  definitions: category
  script:
    - define category <context.item.flag[category]> if:<[category].exists.not>
    - define inv <inventory[crafting_book_category_inventory]>
    - foreach <server.flag[recipe_book.categories.<[category]>].keys> as:item:
      - give <item[<[item]>].with[flag=run_script:custom_recipe_inventory_open;flag=recipe_id:<server.flag[recipe_book.categories.<[category]>.<[item]>]>]> to:<[inv]>
    - inventory open d:<[inv]>