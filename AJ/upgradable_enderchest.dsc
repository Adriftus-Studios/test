upgradable_enderchest_events:
  type: world
  debug: false
  events:
    on player opens ender_chest:
    - if !<inventory[enderchest_<player.uuid>].is_truthy>:
      - note <inventory[upgradable_enderchest_inventory]> as:enderchest_<player.uuid>
      - define inventory <inventory[enderchest_<player.uuid>]>
      - foreach <player.enderchest.map_slots> key:slot as:item:
        - inventory set d:<[inventory]> slot:<[slot]> o:<[item].with[quantity=<[item].quantity>]>
      - define row 4
      - inject upgradable_enderchest_process_inventory
    - determine passively cancelled
    - inventory open d:<inventory[enderchest_<player.uuid>]>
    on player clicks upgradable_enderchest_filler_gray in upgradable_enderchest_inventory:
    - determine passively cancelled
    on player clicks upgradable_enderchest_filler_red in upgradable_enderchest_inventory:
    - determine passively cancelled
    - narrate <context.item.flag[row]>

upgradable_enderchest_process_inventory:
  type: task
  debug: false
  definitions: inventory|row
  script:
  - take from:<[inventory]> item:upgradable_enderchest_filler_gray quantity:54
  - take from:<[inventory]> item:upgradable_enderchest_filler_red quantity:54
  - if <[row]> > 6:
    - stop
  - define lore "<list[<&c><script[upgradable_enderchest_config].data_key[prices.<[row]>].parse_value_tag[<[parse_value]> <[parse_key].replace[_].with[ ].to_titlecase><tern[<[parse_value].equals[1].not>].pass[s].fail[]>].values.separated_by[<&nl>]>]>"
  - repeat 9 from:<script[upgradable_enderchest_config].data_key[starts.<[row]>]>:
    - inventory flag d:<[inventory]> slot:<[value]> row:<[row]>
    - inventory set d:<[inventory]> slot:<[value]> o:<item[upgradable_enderchest_filler_red].with[lore=<[lore]>]>
  - define n <script[upgradable_enderchest_config].data_key[starts.<[row]>].add[9]>
  - repeat <element[55].sub[<[n]>]> from:<[n]>:
    - inventory set d:<[inventory]> slot:<[value]> o:<item[upgradable_enderchest_filler_gray]>

upgradable_enderchest_config:
  type: data
  prices:
    4:
      dragon_head: 1
    5:
      dragon_head: 3
      dragon_egg: 1
    6:
      dragon_head: 5
      dragon_egg: 1
  starts:
    4: 28
    5: 37
    6: 46

upgradable_enderchest_inventory:
  type: inventory
  inventory: chest
  size: 54
  slots:
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []

upgradable_enderchest_filler_gray:
  type: item
  material: gray_stained_glass_pane
  display name: <&sp>

upgradable_enderchest_filler_red:
  type: item
  material: red_stained_glass_pane
  display name: <&e>Requirement to unlock<&co>