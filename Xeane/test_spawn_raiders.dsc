test_spawn_blood_raiders:
  type: task
  debug: false
  script:
    - define location <player.location.forward_flat[30].above[15]>
    - define players <player.location.find_players_within[100]>
    - foreach <proc[define_curve1].context[<player.location>|<[location]>|4|-90|0.5]>:
      - playeffect effect:redstone quantity:10 special_data:10|#660000 offset:0.2 at:<[value]> targets:<server.online_players>
      - wait 1t
    - repeat 80:
      - playeffect effect:redstone quantity:40 special_data:10|#660000 offset:0.7 at:<[location]> targets:<server.online_players>
      - wait 2t
    - define players <[location].find_players_within[60]>
    - run test_spawn_blood_raider_particles
    - foreach <[players]> as:target:
      - repeat 2:
        - repeat 5:
          - playeffect effect:redstone quantity:40 special_data:10|#660000 offset:0.7 at:<[location]> targets:<server.online_players>
          - wait 2t
        - run test_spawn_blood_raiders_task def:<[location]>|<[target]>


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
    - repeat 3:
      - playeffect effect:redstone quantity:10 special_data:5|#660000 offset:0.7 at:<[spawn_at].above> targets:<server.online_players>
      - wait 2t
    - spawn test_spawn_blood_radier <[spawn_at]> target:<[target_player]> save:ent
    - flag server test_spawn_blood_raiders:->:<entry[ent].spawned_entity>

test_spawn_blood_raider_particles:
  type: task
  debug: false
  script:
    - waituntil <server.has_flag[test_spawn_blood_raiders]> rate:1s
    - while <server.has_flag[test_spawn_blood_raiders]>:
      - foreach <server.flag[test_spawn_blood_raiders]>:
        - foreach next if:<[value].is_spawned.not>
        - playeffect at:<[value].location> effect:redstone quantity:10 special_data:1|#660000 offset:0.7 targets:<server.online_players>
        - wait 1t

test_spawn_blood_radier:
  type: entity
  debug: false
  entity_type: piglin_brute
  mechanisms:
    custom_name: <&c>Blood Raider
    custom_name_visible: true
  flags:
    on_death: test_spawn_blood_raider_remove

test_spawn_blood_raider_remove:
  type: task
  debug: false
  script:
    - flag server test_spawn_blood_raiders:<-:<context.entity>
    - if <server.flag[test_spawn_blood_raiders].is_empty>:
      - flag server test_spawn_blood_raiders:!