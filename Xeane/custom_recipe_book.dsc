custom_recipe_data_initializer:
  type: world
  debug: false
  data:
    categories:
      travel:
        material: feather
        display: <&a>Travel Items
        lore: <&e>Items related to getting around
  build_item_list:
    - flag server recipe_book:!
    - foreach <server.scripts.filter[data_key[data.recipe_book_category].exists].parse[name]> as:item_script:
      - if !<[item_script].as_item.recipe_ids.is_empty.if_null[true]>:
        - foreach <[item_script].as_item.recipe_ids> as:recipe_id:
          - define result <server.recipe_result[<[recipe_id]>]>
          - foreach <server.recipe_items[<[recipe_id]>]>:
            - if <[value].starts_with[material]>:
              - define value <[value].substring[9].as_item>
            - else if <[value].script.exists>:
              - define value "<item[<[value]>].with[flag=run_script:custom_recipe_inventory_open;flag=recipe_id:<[value].as_item.recipe_ids.get[1].after[<&co>]>;lore=<&e>Click to see Recipe]>"
            - else:
              - define value <[value].as_item>
            - define items:|:<[value]>
          - define category <[result].script.data_key[data.recipe_book_category]>
          - if !<script.data_key[data.categories].keys.contains[<[category]>]>:
            - debug ERROR "ITEM HAS UNKNOWN CATEGORY<&co> <[category]>"
          - flag server recipe_book.<[category]>.<[item_script]>:<[recipe_id]>
          - flag server recipe_book.<[recipe_id].after[<&co>]>.items:!|:<[items]>
          - flag server recipe_book.<[recipe_id].after[<&co>]>.result:!|:<[result]>
  events:
    on server start:
      - inject locally path:build_item_list
    on script reload:
      - inject locally path:build_item_list

custom_recipe_inventory:
  type: inventory
  inventory: workbench
  gui: true

custom_recipe_inventory_open:
  type: task
  debug: true
  definitions: recipe_id
  script:
    - define recipe_id <context.item.flag[recipe_id]> if:<[recipe_id].exists.not>
    - define recipe_id <[recipe_id]>
    - define inventory <inventory[custom_recipe_inventory]>
    - inventory set slot:1 d:<[inventory]> o:<server.flag[recipe_book.<[recipe_id]>.result]>
    - foreach <server.flag[recipe_book.<[recipe_id]>.items]>:
      - foreach next if:<[value].material.name.equals[air].if_null[false]>
      - inventory set slot:<[loop_index].add[1]> d:<[inventory]> o:<[value]>
    - adjust <[inventory]> title:<server.flag[recipe_book.<[recipe_id]>.result].display>
    - inventory open d:<[inventory]>

crafting_book_inventory:
  type: inventory
  title: <&6>Custom Recipes!
  size: 54
  gui: true
  inventory: chest

crafting_book_open:
  type: task
  debug: false
  script:
    - define inv <inventory[crafting_book_inventory]>
    - foreach <server.flag[recipe_book].keys> as:item:
      - give <item[<[item]>].with[flag=run_script:custom_recipe_inventory_open;flag=recipe_id:<server.flag[recipe_book.<[item]>].keys.get[1]>]> to:<[inv]>
    - inventory open d:<[inv]>