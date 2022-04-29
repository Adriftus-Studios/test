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

    # get town corners
    - define lowest_x <[town].spawn.chunk.x>
    - define lowest_z <[town].spawn.chunk.z>
    - define highest_x <[town].spawn.chunk.x>
    - define highest_z <[town].spawn.chunk.z>
    - foreach <[town].plots> as:chunk:
      - if <[chunk].x> < <[lowest_x]>:
        - define lowest_x <[chunk].x>
      - if <[chunk].z> < <[lowest_z]>:
        - define lowest_z <[chunk].z>
      - if <[chunk].x> > <[highest_x]>:
        - define highest_x <[chunk].x>
      - if <[chunk].z> > <[highest_z]>:
        - define highest_z <[chunk].z>
      - wait 1t

    # get all the chunks for fake biomes
    - define biome_chunk_list <list>
    - define start_x <[lowest_x].sub[10]>
    - define start_z <[lowest_z].sub[10]>
    - define x_loop_size <[highest_x].add[10].sub[<[start_x]>]>
    - define z_loop_size <[highest_z].add[10].sub[<[start_z]>]>
    - repeat <[x_loop_size]> as:x:
      - repeat <[z_loop_size]> as:z:
        - define biome_chunk_list:->:<chunk[<[start_x].add[<[x]>]>,<[start_z].add[<[z]>]>,<[base].world.name>]>

    # Define surface blocks
    - foreach <[valid_chunks]>:
      - define all_surface_blocks:|:<[value].surface_blocks.random.above>
      - wait 1t

    # blood sigil start, end, and points between
    - repeat 5:
      - define yaw_add <element[72].mul[<[value]>]>
      - define blood_sigil_<[value]>_start <[base].with_yaw[<[yaw_add]>].forward[8]>
      - wait 1t
    - repeat 5:
      - define yaw_add <element[72].mul[<[value]>]>
      - define blood_sigil_<[value]>_end <[base].with_yaw[<[yaw_add]>].forward[25]>
      - wait 1t
    - repeat 5:
      - define blood_sigil_<[value]>_points <proc[define_curve1].context[<[blood_sigil_<[value]>_start]>|<[blood_sigil_<[value]>_end]>|1|0|1]>
      - wait 1t

    # Flag the Town for the raid
    - flag <[town]> blood_raid.stage:1
    - flag <[town]> blood_raid.portal:5

    # Sky Animation
    - ~run large_blood_raid_start_sky def:<[town]>

    # Start the blood ground animation
    - run large_blood_raid_ground_blood def.town:<[town]> def.valid_chunks:<[valid_chunks]>

    # Let the ground animation run
    - wait 19s

    # Determine iterations
    - if <[all_surface_blocks].size> < 5:
      - define iterations 6
    - else if <[all_surface_blocks].size> < 6:
      - define iterations 5
    - else if <[all_surface_blocks].size> < 8:
      - define iterations 4
    - else if <[all_surface_blocks].size> < 14:
      - define iterations 3
    - else if <[all_surface_blocks].size> < 25:
      - define iterations 2
    - else:
      - define iterations 1

    # Launch Arcs
    - repeat <[iterations]>:
      - foreach <[all_surface_blocks].random[1000]> as:loc:
        - run large_blood_raid_shoot_arc def.town:<[town]> def.start:<[loc]>
        - wait 14t

    # Wait for Arcs
    - waituntil <[town].flag[blood_raid.portal].equals[30]> rate:1s

    - title title:<&color[#990000]><&font[adriftus:overlay]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:6s stay:5s fade_out:6s targets:<server.online_players>

    # Wait for Overlay
    - wait 5s
    # PLAY EXPLOSION SOUNDS
    - run set_fake_biome def.town:<[town]> def.chunks:<[biome_chunk_list]> def.state:true

    # Spawn Blood Sigils
    - flag <[town]> blood_raid.stage:2
    - run blood_sigil_spawn def:<[town]>

    - wait 5s
    - repeat 5:
      - run blood_raid_sigil_activate def.town:<[town]> def.sigil_number:<[value]> def.points:<[blood_sigil_<[value]>_points]>
      - wait 10s

    # DEVELOPMENT FROM HERE DOWN
    - wait 10s
    #CLEANUP - DEBUG
    - title title:<&color[#FFFFFF]><&font[adriftus:overlay]><&chr[0004]><&chr[F801]><&chr[0004]> fade_in:6s stay:5s fade_out:6s targets:<server.online_players>
    - wait 5s
    - remove <[town].flag[blood_raid.sigils]>
    - flag <[town]> blood_raid:!
    - run set_fake_biome def.town:<[town]> def.chunks:<[biome_chunk_list]> def.state:false

# Ground Blood During Raid
large_blood_raid_ground_blood:
  type: task
  debug: false
  definitions: town|valid_chunks
  script:

    # get surface blocks in the chunks
    - define surface_blocks <list>
    - foreach <[valid_chunks]>:
      - define surface_blocks:<[surface_blocks].include_single[<[value].surface_blocks.parse[above[2].center]>]>
      - wait 1t

    # play blood animation
    - while <[town].has_flag[blood_raid]> && <[town].flag[blood_raid.stage]> == 1:
      #- foreach <[surface_blocks]>:
        - playeffect at:<[town].spawn> effect:redstone special_data:1|#990000 offset:120,1,120 quantity:200 targets:<server.online_players>
        - wait 2t

large_blood_raid_shoot_arc:
  type: task
  debug: false
  definitions: town|start
  script:
    - define location <[town].spawn.above[40]>
    - define locations <proc[define_curve1].context[<[start]>|<[location]>|<util.random.int[5].to[25]>|<util.random.int[25].to[75]>|1]>
    - wait 1t
    - repeat 10:
      - playeffect at:<[start].center.above[0.55]> effect:redstone special_data:10|#990000 offset:0.5,0,0.5 quantity:5 targets:<server.online_players>
      - wait 2t
    - foreach <[locations]> as:loc:
        - playeffect at:<[loc]> effect:redstone special_data:10|#990000 offset:0.25 quantity:5 targets:<server.online_players>
        - wait 2t
    - if <[town].flag[blood_raid.portal]> < 30:
      - flag <[town]> blood_raid.portal:+:1

large_blood_raid_start_sky:
  type: task
  debug: false
  definitions: town
  script:
    - define base <[town].spawn>
    # Build the initial points coming from far
    - repeat 5:
      - define yaw_add <element[72].mul[<[value]>]>
      - define location_<[value]> <[base].with_yaw[<[yaw_add]>].above[40].forward[160]>
      - define points_<[value]> <[location_<[value]>].points_between[<[base].above[40]>]>
      - wait 1t
    - define size <[points_1].size>
    - define final_points1 <list>
    - repeat <[size]>:
      - define final_points1 <[final_points1].include_single[<[points_1].get[<[value]>]>|<[points_2].get[<[value]>]>|<[points_3].get[<[value]>]>|<[points_4].get[<[value]>]>|<[points_5].get[<[value]>]>]>
      - wait 1t
    # Build the spiral to the ground
    - repeat 5:
      - define yaw_add <element[72].mul[<[value]>]>
      - define points_<[value]> <proc[define_spiral].context[<[base].above[40]>|<[base].below>|1.25|<[yaw_add]>]>
      - wait 1t
    - define size <[points_1].size>
    - define final_points2 <list>
    - repeat <[size]>:
      - define final_points2 <[final_points2].include_single[<[points_1].get[<[value]>]>|<[points_2].get[<[value]>]>|<[points_3].get[<[value]>]>|<[points_4].get[<[value]>]>|<[points_5].get[<[value]>]>]>
      - wait 1t

    # Play the straight particles with the lists generated above
    - foreach <[final_points1]> as:locations:
      - playeffect at:<[locations]> effect:redstone special_data:10|#990000 offset:0.1 quantity:10 targets:<server.online_players>
      - wait 1t

    # Start the big Sky Portal
    - run large_blood_raid_big_portal def:<[town]>

    # Play the spiral particles with the lists generated above
    - foreach <[final_points2]> as:locations:
      - playeffect at:<[locations]> effect:redstone special_data:3|#990000 offset:0.0 quantity:2 targets:<server.online_players>
      - wait 1t

#<proc[define_spiral].context[<player.location.above[30].forward[5]>|<player.location.forward[5]>|0.75|10]>

large_blood_raid_big_portal:
  type: task
  debug: false
  definitions: town
  script:
    - define location <[town].spawn.above[40]>
    - while <[town].has_flag[blood_raid]> && <[town].flag[blood_raid.stage]> == 1:
      - playeffect at:<[location]> effect:redstone special_data:10|#990000 offset:<[town].flag[blood_raid.portal].mul[0.05]> quantity:<[town].flag[blood_raid.portal].mul[3]> targets:<server.online_players>
      - wait 3t
    - waituntil <[town].has_flag[blood_raid.sigils_active_locations]> rate:10t
    - while <[town].has_flag[blood_raid]> && <[town].flag[blood_raid.stage]> == 2:
      - playeffect at:<[town].flag[blood_raid.sigils_active_locations]> effect:redstone special_data:5|#990000 offset:0 quantity:5 targets:<server.online_players>
      - wait 8t

# Set the fake biome
set_fake_biome:
  type: task
  debug: false
  definitions: town|chunks|state
  script:
    - if <[state]>:
      - define time 5h
    - else:
      - define time 1t
    - foreach <[chunks]> as:chunk:
      - if <[loop_index].mod[30]> == 0:
        - wait 1t
      - fakebiome biome:<biome[adriftus:blood_raid]> players:<server.online_players> chunk:<[chunk]> duration:<[time]>
    - foreach <[chunks]> as:chunk:
      - if <[loop_index].mod[30]> == 0:
        - wait 1t
      - adjust <[chunk]> refresh_chunk

## BLOOD SIGILS
# Activate a Sigil
blood_raid_sigil_activate:
  type: task
  debug: false
  definitions: town|sigil_number|points
  script:
    - define sigil <[town].flag[blood_raid.sigils].get[<[sigil_number]>]>
    - flag <[town]> blood_raid.sigils_active_locations:|:<[sigil].location.above[5]>
    - repeat 14:
      - rotate <[sigil]> yaw:<[value]> duration:1s
      - wait 1s
    - rotate <[sigil]> yaw:15 duration:10s
    - run blood_sigil_effect_<[sigil_number]> def:<[town]>

#Spawn the 5 Sigils
blood_sigil_spawn:
  type: task
  debug: false
  definitions: town
  script:
    - define base <[town].spawn.above[40]>
    - repeat 5:
      - define yaw_add <element[72].mul[<[value]>]>
      - spawn blood_sigil_<[value]> <[base].with_yaw[<[yaw_add]>].forward[25]> save:ent
      - flag <[town]> blood_raid.sigils:->:<entry[ent].spawned_entity>
      - wait 1t

#5 sigil effects
blood_sigil_effect_1:
  type: task
  debug: false
  definitions: town
  script:
    - flag <[town]> blood_raid.sigil_mobs.1:<list>
    - while <list[2|4].contains[<[town].flag[blood_raid.stage]>]>:
      - flag <[town]> blood_raid.sigil_mobs.1:<[town].flag[blood_raid.sigil_mobs.1].filter[is_spawned]>
      - if <[town].flag[blood_raid.sigil_mobs.1].size> <= 4:
        - run blood_sigil_effect_1_spawn def:<[town]>
      - wait 5s

blood_sigil_effect_1_spawn:
  type: task
  debug: false
  definitions: town
  script:
    - define sigil <[town].flag[blood_raid.sigils].first>
    - define start <[sigil].location.above[5]>
    - define location <[start].find_players_within[220].random.location>
    - define locations <proc[define_curve1].context[<[start]>|<[location]>|<util.random.int[5].to[15]>|<util.random.int[75].to[125]>|1]>
    - wait 1t
    - repeat 5:
      - playeffect at:<[start]> effect:redstone special_data:5|#990000 offset:0.5,0,0.5 quantity:5 targets:<server.online_players>
      - wait 2t
    - wait 1t
    - foreach <[locations]> as:loc:
        - playeffect at:<[loc]> effect:redstone special_data:10|#990000 offset:0.25 quantity:5 targets:<server.online_players>
        - wait 2t
    - spawn blood_raid_raider_1 <[locations].last> save:ent
    - wait 1t
    - if <entry[ent].spawned_entity.is_spawned>:
      - flag <[town]> blood_raid.sigil_mobs.1:->:<entry[ent].spawned_entity>
    - else:
      - explode <[locations].last> power:5

blood_raid_raider_1:
  type: entity
  debug: false
  entity_type: skeleton
  mechanisms:
    health_data: 200/200
    custom_name: <&c>Blood Skeleton
    custom_name_visible: true
  flags:
    on_targetting: only_target_players
    on_shoots_bow: blood_raid_bow_shot

blood_raid_bow_shot:
  type: task
  debug: false
  script:
    - wait 1t
    - flag <context.projectile> on_hit_entity:blood_raid_bow_damage
    - while <context.projectile.is_spawned>:
      - playeffect at:<context.projectile.location> effect:redstone special_data:5|#990000 offset:0 quantity:2 targets:<server.online_players>
      - wait 2t
      - if <[loop_index]> > 50:
        - while stop

blood_raid_bow_damage:
  type: task
  debug: false
  script:
    - determine passively cancelled
    - if <context.hit_entity.has_Flag[blood_drain]>:
      - stop
    - flag <context.hit_entity> blood_drain
    - repeat 5:
      - if !<context.hit_entity.is_spawned>:
        - repeat stop
      - hurt <context.hit_entity> 3
      - wait 1s
    - flag <context.hit_entity> blood_drain:!

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