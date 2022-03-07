custom_recipe_data_initializer:
  type: world
  debug: false
  build_item_list:
    - flag server recipe_book:!
    - foreach <server.scripts.filter[container_type.equals[item]].parse[name]>:
      - if !<[value].as_item.recipe_ids.is_empty>:
        
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
    - define inventory <inventory[custom_recipe_inventory]>
    - foreach <list[<server.recipe_result[<[recipe_id]>]>].include[<server.recipe_items[<[recipe_id]>].replace_text[material<&co>].with[]>]>:
      - foreach next if:<[value].material.name.equals[air].if_null[false]>
      - inventory set slot:<[loop_index]> d:<[inventory]> o:<[value]>
    - inventory open d:<[inventory]>