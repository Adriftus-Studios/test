saved_inventory_load:
  type: task
  debug: false
  definitions: name
  script:
    - define current_inventory <player.flag[saved_inventory.current].if_null[default]>
    - flag player saved_inventory.<[current_inventory]>:<player.inventory.map_slots>
    - if <player.has_flag[saved_inventories.<[name]>]>:
      - inventory set o:<player.flag[saved_inventories.<[name]>]> d:<player.inventory>
    - else:
      - inventory clear d:<player.inventory>
    - flag <player> saved_inventory.current:<[name]>