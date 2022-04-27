large_blood_raid:
  type: task
  debug: false
  definitions: town
  script:
    # Get the home chunk
    - define base <[town].spawn.with_pose[0,0]>

    # Determine valid chunks in range
    - foreach <[town].plots> as:chunk:
      - if <[loop_index].mod[10]> == 0:
        - wait 1t
      - if <[chunk].cuboid.center.distance[<[base]>]> < 200:
        - define valid_chunks:->:<[chunk]>

    # Define surface blocks
    - foreach <[valid_chunks]>:
      - define all_surface_blocks:|:<[value].surface_blocks.random.above>
      - wait 1t

    # Flag the Town for the raid
    - flag <[town]> blood_raid.stage:1
    - flag <[town]> blood_raid.portal:1

    # Sky Animation
    - ~run large_blood_raid_start_sky def:<[base]>

    # Start persistent portal
    - run large_blood_raid_big_portal def:<[town]>

    # Start the blood ground animation
    - run large_blood_raid_ground_blood def.town:<[town]> def.valid_chunks:<[valid_chunks]>

    # Let the ground animation run
    - wait 19s

    # Determine iterations
    - if <[all_surface_blocks].size> < 5:
      - define iterations 6
    - else if <[all_surface_blocks].size> < 8:
      - define iterations 5
    - else if <[all_surface_blocks].size> < 12:
      - define iterations 4
    - else if <[all_surface_blocks].size> < 15:
      - define iterations 3
    - else:
      - define iterations 2

    # Launch Arcs
    - repeat <[iterations]>:
      - foreach <[all_surface_blocks]> as:loc:
        - run large_blood_raid_shoot_arc def.town:<[town]> def.start:<[loc]>
        - wait 14t

    # Wait for Arcs
    - waituntil <[town].flag[blood_raid.portal].equals[25]> rate:1s

    - title title:<&c><&font[adriftus:overlay]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:5s stay:1s fade_out:1t targets:<server.online_players>

    # Wait for Overlay
    - wait 5s
    # PLAY EXPLOSION SOUNDS

    # Spawn Blood Sigils
    - flag <[town]> blood_raid.stage:2
    - run blood_sigil_spawn def:<[town]>

    - wait 20s
    #CLEANUP - DEBUG
    - remove <[town].flag[blood_raid.sigils]>
    - flag <[town]> blood_raid:!

# Ground Blood During Raid
large_blood_raid_ground_blood:
  type: task
  debug: false
  definitions: town|valid_chunks
  script:

    # get surface blocks in the chunks
    - define surface_blocks <list>
    - foreach <[valid_chunks]>:
      - define surface_blocks:<[surface_blocks].include_single[<[value].surface_blocks.parse[above]>]>
      - wait 1t

    # play blood animation
    - while <[town].has_flag[blood_raid]> && <[town].flag[blood_raid.stage]> == 1:
      - foreach <[surface_blocks]>:
        - playeffect at:<[value].random[5]> effect:redstone special_data:10|#660000 offset:0.45 quantity:3 targets:<server.online_players>
        - wait 1t

large_blood_raid_shoot_arc:
  type: task
  debug: false
  definitions: town|start
  script:
    - define location <[town].spawn.above[40]>
    - define locations <proc[define_curve1].context[<[start]>|<[location]>|<util.random.int[5].to[25]>|<util.random.int[25].to[75]>|1]>
    - foreach <[locations]> as:loc:
        - playeffect at:<[loc]> effect:redstone special_data:10|#660000 offset:0.25 quantity:5 targets:<server.online_players>
        - wait 2t
    - if <[town].flag[blood_raid.portal]> < 25:
      - flag <[town]> blood_raid.portal:+:1

large_blood_raid_start_sky:
  type: task
  debug: false
  definitions: base
  script:
    - repeat 5:
      - define yaw_add <element[72].mul[<[value]>]>
      - define location_<[value]> <[base].with_yaw[<[yaw_add]>].above[40].forward[160]>
      - define points_<[value]> <[location_<[value]>].points_between[<[base].above[40]>]>
      - wait 1t
    - define size <[points_1].size>
    - define final_points <list>
    - repeat <[size]>:
      - define final_points <[final_points].include_single[<[points_1].get[<[value]>]>|<[points_2].get[<[value]>]>|<[points_3].get[<[value]>]>|<[points_4].get[<[value]>]>|<[points_5].get[<[value]>]>]>
      - wait 1t
    - foreach <[final_points]> as:locations:
      - playeffect at:<[locations]> effect:redstone special_data:10|#660000 offset:0.1 quantity:10 targets:<server.online_players>
      - wait 1t

large_blood_raid_big_portal:
  type: task
  debug: false
  definitions: town
  script:
    - define location <[town].spawn.above[40]>
    - while <[town].has_flag[blood_raid]> && <[town].flag[blood_raid.stage]> == 1:
      - playeffect at:<[location]> effect:redstone special_data:10|#660000 offset:<[town].flag[blood_raid.portal].mul[0.05]> quantity:<[town].flag[blood_raid.portal].mul[3]> targets:<server.online_players>
      - wait 3t
    - while <[town].has_flag[blood_raid]> && <[town].flag[blood_raid.stage]> == 2:
      - playeffect at:<[location]> effect:redstone special_data:10|#660000 offset:10,1,10 quantity:20 targets:<server.online_players>
      - wait 3t

blood_sigil_spawn:
  type: task
  debug: false
  definitions: town
  script:
    - define base <[town].spawn.above[40]>
    - repeat 5:
      - define yaw_add <element[72].mul[<[value]>]>
      - spawn blood_sigil_<[value]> <[base].with_yaw[<[yaw_add]>].forward[8]> save:ent
      - flag <[town]> blood_raid.sigils:->:<entry[ent].spawned_entity>
      - wait 1t

blood_sigil_1:
  type: entity
  entity_type: armor_stand
  mechanisms:
    visible: false
    marker: true
    equipment:
      - air
      - air
      - air
      - leather_horse_armor[custom_model_data=300]

blood_sigil_2:
  type: entity
  entity_type: armor_stand
  mechanisms:
    visible: false
    marker: true
    equipment:
      - air
      - air
      - air
      - leather_horse_armor[custom_model_data=301]

blood_sigil_3:
  type: entity
  entity_type: armor_stand
  mechanisms:
    visible: false
    marker: true
    equipment:
      - air
      - air
      - air
      - leather_horse_armor[custom_model_data=302]

blood_sigil_4:
  type: entity
  entity_type: armor_stand
  mechanisms:
    visible: false
    marker: true
    equipment:
      - air
      - air
      - air
      - leather_horse_armor[custom_model_data=303]

blood_sigil_5:
  type: entity
  entity_type: armor_stand
  mechanisms:
    visible: false
    marker: true
    equipment:
      - air
      - air
      - air
      - leather_horse_armor[custom_model_data=304]