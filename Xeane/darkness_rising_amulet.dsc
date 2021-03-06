first_piece_of_nine:
  type: item
  material: gold_nugget
  display name: <&e>First Piece of Nine
  lore:
    - "<&e>A fractured symbol..."
    - "<&b>Craft all 9 together"

second_piece_of_nine:
  type: item
  material: gold_nugget
  display name: <&e>Second Piece of Nine
  lore:
    - "<&e>A fractured symbol..."
    - "<&b>Craft all 9 together"

third_piece_of_nine:
  type: item
  material: gold_nugget
  display name: <&e>Third Piece of Nine
  lore:
    - "<&e>A fractured symbol..."
    - "<&b>Craft all 9 together"

fourth_piece_of_nine:
  type: item
  material: gold_nugget
  display name: <&e>Fourth Piece of Nine
  lore:
    - "<&e>A fractured symbol..."
    - "<&b>Craft all 9 together"

fifth_piece_of_nine:
  type: item
  material: gold_nugget
  display name: <&e>Fifth Piece of Nine
  lore:
    - "<&e>A fractured symbol..."
    - "<&b>Craft all 9 together"

Sixth_piece_of_nine:
  type: item
  material: gold_nugget
  display name: <&e>Sixth Piece of Nine
  lore:
    - "<&e>A fractured symbol..."
    - "<&b>Craft all 9 together"

seventh_piece_of_nine:
  type: item
  material: gold_nugget
  display name: <&e>Seventh Piece of Nine
  lore:
    - "<&e>A fractured symbol..."
    - "<&b>Craft all 9 together"

eighth_piece_of_nine:
  type: item
  material: gold_nugget
  display name: <&e>Eighth Piece of Nine
  lore:
    - "<&e>A fractured symbol..."
    - "<&b>Craft all 9 together"

final_piece_of_nine:
  type: item
  material: gold_nugget
  display name: <&e>Final Piece of Nine
  lore:
    - "<&e>A fractured symbol..."
    - "<&b>Craft all 9 together"

darkness_rising_amulet:
  type: item
  material: gold_nugget
  display name: <&c>Darkness Rising Amulet
  lore:
    - "<&c>Summons a Skeleton"
    - "<&e>1 Minute Cooldown"
  flags:
    right_click_script: darkness_rising_amulet_summon
    on_craft: darkness_rising_amulet_crafted
    on_recipe_formed: darkness_rising_amulet_recipe_formed
  recipes:
    1:
      type: shapeless
      input: first_piece_of_nine|second_piece_of_nine|third_piece_of_nine|fourth_piece_of_nine|fifth_piece_of_nine|sixth_piece_of_nine|seventh_piece_of_nine|eight_piece_of_nine|final_piece_of_nine

darkness_rising_amulet_summon:
  type: task
  debug: true
  script:
    - ratelimit <player> 1s
    - if <player.has_flag[darkness_amulet_used]>:
      - narrate "<&c>This item is still on cooldown"
      - stop
    - define loc <player.location.forward_flat[1]>
    - spawn darkness_rising_skeleton <[loc].below[2]> save:skele
    - if !<entry[skele].is_spawned>:
      - narrate "<&c>Unable to use this here..."
      - stop
    - flag <entry[skele].spawned_entity> no_suffocate expire:5s
    - define targets <[loc].find_players_within[120]>
    - adjust <entry[skele].spawned_entity> has_ai:false
    - flag <entry[skele].spawned_entity> owner:<player>
    - repeat 10:
      - playeffect at:<[loc]> effect:redstone special_data:5|black quantity:20 offset:1,0.5,1 targets:<[targets]>
      - teleport <entry[skele].spawned_entity> <entry[skele].spawned_entity.location.above[0.2]>
      - wait 1t
    - adjust <entry[skele].spawned_entity> has_ai:true
    - flag player darkness_amulet_used expire:1m
    - run darkness_rising_skeleton_attack def:<entry[skele].spawned_entity>

darkness_rising_amulet_recipe_formed:
  type: task
  debug: false
  script:
    - determine cancelled if:<server.has_flag[darkness_amulet_crafted]>

darkness_rising_skeleton:
  type: entity
  entity_type: skeleton
  mechanisms:
    health_data: 100/100
    custom_name: <&c>Dark Skeleton
    custom_name_visible: true
  flags:
    on_target: darkness_rising_skeleton_target
    on_damaged: darkness_rising_skeleton_damaged
    on_death: darkness_rising_skeleton_death
    on_combust: cancel

darkness_rising_skeleton_target:
  type: task
  debug: false
  script:
    - if <context.target> == <context.entity.flag[owner]>:
      - determine cancelled

darkness_rising_skeleton_damaged:
  type: task
  debug: false
  script:
    - determine cancelled if:<list[FIRE|FIRE_TICK].contains[<context.cause>]>

darkness_rising_skeleton_death:
  type: task
  debug: false
  script:
    - determine passively NO_DROPS
    - determine NO_XP

darkness_rising_skeleton_attack:
  type: task
  debug: false
  definitions: entity
  script:
    - wait 1t
    - while <[entity].is_spawned>:
      - if !<[entity].target.exists> || !<[entity].target.is_spawned>:
        - define target <[entity].location.find_entities.within[30].exclude[<[entity]>|<[entity].flag[owner]>].filter[can_see[<[entity]>]].first>
        - if <[target].exists>:
          - attack <[entity]> target:<[target]>
      - wait 5s
    - if <[entity].is_spawned>:
      - run darkness_rising_skeleton_attack def:<[entity]>

darkness_rising_inventory:
  type: inventory
  inventory: chest
  title: <&c>Darkness Chest
  size: 9

darkness_rising_chest:
  type: task
  debug: false
  data:
    1: first_piece_of_nine
    2: second_piece_of_nine
    3: third_piece_of_nine
    4: fourth_piece_of_nine
    5: fifth_piece_of_nine
    6: sixth_piece_of_nine
    7: seventh_piece_of_nine
    8: eighth_piece_of_nine
    9: final_piece_of_nine
  script:
    - determine passively cancelled
    - define chest_id <context.location.flag[darkness_rising_chest]>
    - stop if:<player.has_flag[darkness_rising_chest.<[chest_id]>]>
    - define inv <inventory[darkness_rising_inventory]>
    - give <script.data_key[data.<[chest_id]>]> to:<[inv]>
    - give tpa_crystal quantity to:<[inv]>
    - give back_crystal quantity to:<[inv]>
    - give grappling_hook_basic to:<[inv]> if:<[chest_id].equals[9]>
    - inventory open d:<[inv]>
    - flag player darkness_rising_chest.<[chest_id]>