test_spawn_blood_crystal:
  type: item
  debug: false
  material: snowball
  mechanisms:
    custom_model_data: 1
  flags:
    on_projectile_launched: test_spawn_blood_raiders_flag_projectile

test_spawn_blood_raiders_flag_projectile:
  type: task
  debug: false
  script:
    - flag <context.entity> on_hit_block:test_spawn_blood_raiders

test_spawn_blood_raiders:
  type: task
  debug: false
  definitions: start|location
  script:
    - define start <context.location> if:<[start].exists.not>
    - define location <context.location.above[20]> if:<[location].exists.not>
    - define players <[start].find_players_within[100]>
    - flag server test_spawn_blood_raiders_active
    - run test_spawn_blood_raiders_biome_change def:<[location]>
    - foreach <[start].points_between[<[location]>].distance[0.5]>:
      - playeffect effect:redstone quantity:5 special_data:10|#660000 offset:0.2 at:<[value]> targets:<server.online_players>
      - wait 1t
    - repeat 100:
      - playeffect effect:redstone quantity:40 special_data:10|#660000 offset:0.7 at:<[location]> targets:<server.online_players>
      - wait 2t
    - define players <[location].find_players_within[60]>
    - run test_spawn_blood_raider_particles
    - if <[players].size> <= 2:
      - define count 4
    - else:
      - define count 2
    - foreach <[players]> as:target:
      - repeat <[count]>:
        - repeat 5:
          - playeffect effect:redstone quantity:40 special_data:10|#660000 offset:0.7 at:<[location]> targets:<server.online_players>
          - wait 2t
        - run test_spawn_blood_raiders_task def:<[location]>|<[target]>
    - repeat 40:
        - playeffect effect:redstone quantity:40 special_data:10|#660000 offset:0.7 at:<[location]> targets:<server.online_players>
        - wait 2t
    - while <server.has_flag[test_spawn_blood_raiders]>:
      - playeffect effect:redstone quantity:40 special_data:10|#660000 offset:0.7 at:<[location]> targets:<server.online_players>
      - wait 4t
    - repeat 40:
        - playeffect effect:redstone quantity:40 special_data:10|#660000 offset:0.7 at:<[location]> targets:<server.online_players>
        - wait 2t
    - define players <[location].find_players_within[60]>
    - foreach <[players]> as:target:
      - repeat <[count]>:
        - repeat 5:
          - playeffect effect:redstone quantity:40 special_data:10|#660000 offset:0.7 at:<[location]> targets:<server.online_players>
          - wait 2t
        - run test_spawn_blood_raiders_task2 def:<[location]>|<[target]>
    - repeat 40:
        - playeffect effect:redstone quantity:40 special_data:10|#660000 offset:0.7 at:<[location]> targets:<server.online_players>
        - wait 2t
    - while <server.has_flag[test_spawn_blood_raiders]>:
      - playeffect effect:redstone quantity:40 special_data:10|#660000 offset:0.7 at:<[location]> targets:<server.online_players>
      - wait 4t
    - repeat 40:
        - playeffect effect:redstone quantity:40 special_data:10|#660000 offset:0.7 at:<[location]> targets:<server.online_players>
        - wait 2t
    - define players <[location].find_players_within[60]>
    - run test_spawn_blood_raiders_task3 def:<[location]>|<[players].random>


test_spawn_blood_raiders_task:
  type: task
  debug: false
  definitions: location|target_player
  script:
    - define spawn_at <[target_player].location.find_spawnable_blocks_within[8].random>
    - define locations <proc[define_curve1].context[<[location]>|<[spawn_at]>|<util.random.int[5].to[15]>|<util.random.int[45].to[180]>|1]>
    - foreach <[locations]>:
      - playeffect effect:redstone quantity:10 special_data:5|#660000 offset:0.2 at:<[value]> targets:<server.online_players>
      - wait 2t
    - repeat 5:
      - playeffect effect:redstone quantity:10 special_data:5|#660000 offset:0.7 at:<[spawn_at].above> targets:<server.online_players>
      - wait 2t
    - spawn test_spawn_blood_radier <[spawn_at]> target:<[target_player]> save:ent
    - flag server test_spawn_blood_raiders:->:<entry[ent].spawned_entity>
    - adjust <entry[ent].spawned_entity> "custom_name:<entry[ent].spawned_entity.script.parsed_key[mechanisms.custom_name]> <entry[ent].spawned_entity.health_data>"

test_spawn_blood_raiders_task2:
  type: task
  debug: false
  definitions: location|target_player
  script:
    - define spawn_at <[location].sub[<[location].sub[<[target_player].location>].mul[0.8]>].highest.above>
    - define locations <proc[define_curve1].context[<[location]>|<[spawn_at]>|<util.random.int[5].to[15]>|<util.random.int[45].to[180]>|1]>
    - foreach <[locations]>:
      - playeffect effect:redstone quantity:10 special_data:5|#660000 offset:0.2 at:<[value]> targets:<server.online_players>
      - wait 2t
    - repeat 5:
      - playeffect effect:redstone quantity:10 special_data:5|#660000 offset:0.7 at:<[spawn_at].above> targets:<server.online_players>
      - wait 2t
    - spawn test_spawn_blood_radier2 <[spawn_at]> target:<[target_player]> save:ent
    - flag server test_spawn_blood_raiders:->:<entry[ent].spawned_entity>
    - adjust <entry[ent].spawned_entity> "custom_name:<entry[ent].spawned_entity.script.parsed_key[mechanisms.custom_name]> <entry[ent].spawned_entity.health_data>"

test_spawn_blood_raiders_task3:
  type: task
  debug: false
  definitions: location|target_player
  script:
    - define spawn_at <[location].sub[<[location].sub[<[target_player].location>].mul[0.25]>].highest.above>
    - define locations <proc[define_curve1].context[<[location]>|<[spawn_at]>|5|90|1]>
    - foreach <[locations]>:
      - playeffect effect:redstone quantity:10 special_data:5|#660000 offset:0.7 at:<[value]> targets:<server.online_players>
      - wait 2t
    - repeat 5:
      - playeffect effect:redstone quantity:10 special_data:5|#660000 offset:0.7 at:<[spawn_at].above> targets:<server.online_players>
      - wait 2t
    - spawn test_spawn_blood_radier3 <[spawn_at]> target:<[target_player]> save:ent
    - adjust <entry[ent].spawned_entity> "custom_name:<entry[ent].spawned_entity.script.parsed_key[mechanisms.custom_name]> <entry[ent].spawned_entity.health_data>"

test_spawn_blood_raider_particles:
  type: task
  debug: false
  script:
    - waituntil <server.has_flag[test_spawn_blood_raiders]> rate:1s
    - while <server.has_flag[test_spawn_blood_raiders]>:
      - foreach <server.flag[test_spawn_blood_raiders]>:
        - foreach next if:<[value].is_spawned.not>
        - playeffect at:<[value].location.above> effect:redstone quantity:10 special_data:1|#660000 offset:0.7 targets:<server.online_players>
        - wait 1t

test_spawn_blood_radier:
  type: entity
  debug: false
  entity_type: zombified_piglin
  mechanisms:
    health_data: 200/200
    custom_name: <&c>Blood Raider
    custom_name_visible: true
  flags:
    on_death: test_spawn_blood_raider_remove
    on_damaged: test_spawn_blood_raider_update_name

test_spawn_blood_radier2:
  type: entity
  debug: false
  entity_type: zombified_piglin
  mechanisms:
    health_data: 200/200
    custom_name: <&c>Blood Raider2
    custom_name_visible: true
  flags:
    on_death: test_spawn_blood_raider_remove
    on_damaged: test_spawn_blood_raider_update_name

test_spawn_blood_radier3:
  type: entity
  debug: false
  entity_type: zombified_piglin
  mechanisms:
    health_data: 200/200
    custom_name: <&c>Blood Raider2
    custom_name_visible: true
  flags:
    on_death: test_spawn_blood_raider_boss_death
    on_damaged: test_spawn_blood_raider_update_name

test_spawn_blood_raider_remove:
  type: task
  debug: false
  script:
    - flag server test_spawn_blood_raiders:<-:<context.entity>
    - if <server.flag[test_spawn_blood_raiders].is_empty>:
      - flag server test_spawn_blood_raiders:!

test_spawn_blood_raiders_biome_change:
  type: task
  debug: false
  script:
    - define chunk <[location].chunk>
    - define ox <[chunk].x>
    - define oz <[chunk].z>
    - repeat 11 as:x:
      - define tx <[oz].sub[<[x].sub[6]>]>
      - repeat 11 as:z:
        - define tz <[oz].sub[<[z].sub[6]>]>
        - if !<chunk[<[x]>,<[tz]>,<[chunk].world>].is_loaded>:
          - chunkload <chunk[<[x]>,<[tz]>,<[chunk].world>]> duration:10s
        - foreach <chunk[<[x]>,<[tz]>,<[chunk].world>].cuboid.blocks[air].filter[y.is_less_than[<[location].y.add[30]>]]>:
          - flag <[value]> test_spawn_blood_raiders_biome:<[value].biome>
          - if <[loop_index].mod[30]> == 0:
            - wait 1t
        - foreach <chunk[<[x]>,<[tz]>,<[chunk].world>].cuboid.blocks[air].filter[y.is_less_than[<[location].y.add[30]>]]>:
          - adjust <[value]> biome:forest
          - if <[loop_index].mod[30]> == 0:
            - wait 1t
        - foreach <chunk[<[x]>,<[tz]>,<[chunk].world>]>:
          - adjust <[chunk]> refresh_chunk
    - waituntil <server.has_flag[test_spawn_blood_raiders_active].not> rate:1s
    - repeat 11 as:x:
      - define tx <[oz].sub[<[x].sub[6]>]>
      - repeat 11 as:z:
        - define tz <[oz].sub[<[z].sub[6]>]>
        - if !<chunk[<[x]>,<[tz]>,<[chunk].world>].is_loaded>:
          - chunkload <chunk[<[x]>,<[tz]>,<[chunk].world>]> duration:10s
        - foreach <chunk[<[x]>,<[tz]>,<[chunk].world>].cuboid.blocks[air].filter[y.is_less_than[<[location].y.add[30]>]]>:
          - adjust <[value]> biome:<[value].flag[test_spawn_blood_raiders_biome]>
          - flag <[value]> test_spawn_blood_raiders_biome:!
          - if <[loop_index].mod[30]> == 0:
            - wait 1t
        - foreach <chunk[<[x]>,<[tz]>,<[chunk].world>]>:
          - adjust <[chunk]> refresh_chunk

test_spawn_blood_raider_update_name:
  type: task
  debug: false
  script:
    - wait 1t
    - adjust <context.entity> "custom_name:<context.entity.script.parsed_key[mechanisms.custom_name]> <context.entity.health.round>/<context.entity.health_max>"

test_spawn_blood_raider_boss_death:
  type: task
  debug: false
  script:
    - flag server test_spawn_blood_raiders_active:!