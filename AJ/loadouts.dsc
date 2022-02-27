inventory_class_selector_events:
  type: world
  debug: false
  events:
    on player right clicks entity_flagged:loadout:
    - determine passively cancelled
    - define loadout <context.entity.flag[loadout]>
    - narrate <[loadout]>
    - if <player.is_sneaking>:
      - run loadout_set_inventory def:<[loadout]>|<player>
    - else:
      - run loadout_restore_inventory def:<[loadout]>|<player>

loadout_restore_inventory:
  type: task
  debug: false
  definitions: loadoutNumber|player
  script:
  - if <[player].if_null[null]> == null:
    - stop
  - if <[loadoutNumber].if_null[null]> == null:
    - stop
  - if !<[player].has_flag[loadout.<[loadoutNumber]>]>:
    - stop
  - inventory clear d:<[player].inventory>
  - foreach <[player].flag[loadout.<[loadoutNumber]>]> key:slot as:item:
    - inventory set d:<[player].inventory> slot:<[slot]> o:<[item]>

loadout_set_inventory:
  type: task
  debug: false
  definitions: loadoutNumber|player
  script:
  - if <[player].if_null[null]> == null:
    - stop
  - if <[loadoutNumber].if_null[null]> == null:
    - stop
  - foreach <[player].inventory.map_slots> key:slot as:item:
    - flag <[player]> loadout.<[loadoutNumber]>.<[slot]>:<[item]>