inventory_class_selector_events:
  type: world
  debug: false
  events:
    on player right clicks entity_flagged:loadout:
    - determine passively cancelled
    - define loadout <context.entity.flag[loadout]>
    - if <player.is_sneaking>:
      - run loadout_set_inventory def:<[loadout]>|<player>
    - else:
      - run loadout_restore_inventory def:<[loadout]>|<player>

loadout_restore_inventory:
  type: task
  debug: false
  definitions: loadoutNumber|player
  script:
  - stop if:<[player].is_truthy.not>
  - stop if:<[loadoutNumber].is_truthy.not>
  - stop if:<[player].has_flag[loadout.items.<[loadoutNumber]>].not>
  - inventory clear d:<[player].inventory>
  - foreach <[player].flag[loadout.items.<[loadoutNumber]>]> key:slot as:item:
    - inventory set d:<[player].inventory> slot:<[slot]> o:<[item]>

loadout_set_inventory:
  type: task
  debug: false
  definitions: loadoutNumber|player
  script:
  - stop if:<[player].is_truthy.not>
  - stop if:<[loadoutNumber].is_truthy.not>
  - flag <[player]> loadout.items.<[loadoutNumber]>:!
  - flag <[player]> loadout.display.<[loadoutNumber]>:!
  - foreach <[player].inventory.map_slots> key:slot as:item:
    - flag <[player]> loadout.items.<[loadoutNumber]>.<[slot]>:<[item]>
  - flag <[player]> loadout.display.<[loadoutNumber]>.head:<player.equipment.get[3]>
  - flag <[player]> loadout.display.<[loadoutNumber]>.chest:<player.equipment.get[2]>
  - flag <[player]> loadout.display.<[loadoutNumber]>.legs:<player.equipment.get[1]>
  - flag <[player]> loadout.display.<[loadoutNumber]>.feet:<player.equipment.get[0]>
  - flag <[player]> loadout.display.<[loadoutNumber]>.hand:<player.item_in_hand>
  - flag <[player]> loadout.display.<[loadoutNumber]>.offhand:<player.item_in_offhand>

loadout_update_visual:
  type: task
  debug: false
  definitions: loadoutNumber|player
  script:
  - stop if:<[player].is_truthy.not>
  - stop if:<[loadoutNumber].is_truthy.not>
  - stop if:<[player].has_flag[loadout.display.<[loadoutNumber]>]>