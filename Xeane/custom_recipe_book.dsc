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
  debug: false
  definitions: recipe_id
  script:
    - define inventory <inventory[custom_recipe_inventory]>
    - inventory open d:<[inventory]>
    - adjust <player.open_inventory> matrix:<server.recipe_items[<[recipe_id]>].replace_text[material<&co>].with[]>