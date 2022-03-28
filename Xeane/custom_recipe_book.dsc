custom_recipe_data_initializer:
  type: world
  debug: false
  build_item_list:
    - flag server recipe_book:!
    - foreach <server.scripts.filter[container_type.equals[item]].parse[name]> as:item_script:
      - if !<[item_script].as_item.recipe_ids.is_empty.if_null[true]>:
        - foreach <[item_script].as_item.recipe_ids> as:recipe_id:
          - flag server recipe_book.<[item_script]>.<[recipe_id].after[<&co>]>:!|:<list[<server.recipe_result[<[recipe_id]>]>].include[<server.recipe_items[<[recipe_id]>].replace_text[material<&co>].with[]>]>
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
    - define inventory <inventory[custom_recipe_inventory]>
    - foreach <list[<server.recipe_result[<[recipe_id]>]>].include[<server.recipe_items[<[recipe_id]>].replace_text[material<&co>].with[]>]>:
      - foreach next if:<[value].material.name.equals[air].if_null[false]>
      - inventory set slot:<[loop_index]> d:<[inventory]> o:<[value]>
    - adjust <[inventory]> title:<server.recipe_result[<[recipe_id]>].display>
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
      - give <item[<[item]>].with[flag=run_script:custom_recipe_inventory_open;flag=recipe_id:denizen<&co><server.flag[recipe_book.<[item]>].keys.get[1]>]> to:<[inv]>
    - inventory open d:<[inv]>