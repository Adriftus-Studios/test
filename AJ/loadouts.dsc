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
  - stop if:<[player].has_flag[loadout.<[loadoutNumber]>].not>
  - inventory clear d:<[player].inventory>
  - foreach <[player].flag[loadout.<[loadoutNumber]>]> key:slot as:item:
    - inventory set d:<[player].inventory> slot:<[slot]> o:<[item]>

loadout_set_inventory:
  type: task
  debug: false
  definitions: loadoutNumber|player
  script:
  - stop if:<[player].is_truthy.not>
  - stop if:<[loadoutNumber].is_truthy.not>
  - flag <[player]> loadout.<[loadoutNumber]>:!
  - foreach <[player].inventory.map_slots> key:slot as:item:
    - flag <[player]> loadout.<[loadoutNumber]>.<[slot]>:<[item]>