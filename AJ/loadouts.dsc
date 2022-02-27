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
      on player joins:
      - repeat 3:
        - run loadout_update_visual def:<[value]>|<player>

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
  - flag <[player]> loadout.display.<[loadoutNumber]>.head:<player.equipment_map.get[helmet].if_null[<item[air]>]>
  - flag <[player]> loadout.display.<[loadoutNumber]>.chest:<player.equipment_map.get[chestplate].if_null[<item[air]>]>
  - flag <[player]> loadout.display.<[loadoutNumber]>.legs:<player.equipment_map.get[leggings].if_null[<item[air]>]>
  - flag <[player]> loadout.display.<[loadoutNumber]>.feet:<player.equipment_map.get[boots].if_null[<item[air]>]>
  - flag <[player]> loadout.display.<[loadoutNumber]>.hand:<player.item_in_hand>
  - flag <[player]> loadout.display.<[loadoutNumber]>.offhand:<player.item_in_offhand>
  - run loadout_update_visual def:<[loadoutNumber]>|<[player]>

loadout_update_visual:
  type: task
  debug: true
  definitions: loadoutNumber|player
  script:
  - stop if:<[player].is_truthy.not>
  - stop if:<[loadoutNumber].is_truthy.not>
  - stop if:<[player].has_flag[loadout.display.<[loadoutNumber]>].not>
  - define armorstand <location[loadout.<[loadoutNumber]>].find_entities[armor_stand].within[0.00001]>
  - define hand:<[player].flag[loadout.display.<[loadoutNumber]>.hand]>
  - define offhand:<[player].flag[loadout.display.<[loadoutNumber]>.offhand]>
  - define head:<[player].flag[loadout.display.<[loadoutNumber]>.head]>
  - define chest:<[player].flag[loadout.display.<[loadoutNumber]>.chest]>
  - define legs:<[player].flag[loadout.display.<[loadoutNumber]>.legs]>
  - define boots:<[player].flag[loadout.display.<[loadoutNumber]>.feet]>
  - fakeequip <[armorstand]> for:<[player]> hand:<[hand]> offhand:<[offhand]> head:<[head]> chest:<[chest]> legs:<[legs]> boots:<[boots]>