test_spawn_blood_raiders:
  type: task
  debug: false
  script:
    - define location <player.location.forward[30].above[15]>
    - define players <player.location.find_players_within[100]>
    - foreach <proc[define_curve1].context[<player.location>|<[location]>|2|-90|0.5]>:
      - playeffect redstone quantity:10 special_data:10|red offset:0.2 at:<[value]> targets:<server.online_players>
      - wait 1t
    - repeat 80:
      - playeffect redstone quantity:40 special_data:10|red offset:0.7 at:<[location]> targets:<server.online_players>
      - wait 2t
    - define players <[location].find_players_within[60]>
    - foreach <[players]> as:target:
      - repeat 2:
        - repeat 5:
          - playeffect redstone quantity:40 special_data:10|red offset:0.7 at:<[location]> targets:<server.online_players>
          - wait 1t
        - run test_spawn_blood_raiders_task def:<[location]>|<[target]>


test_spawn_blood_raiders_task:
  type: task
  debug: false
  definitions: location|target_player
  script:
    - define spawn_at <[target_player].location.find_spawnable_blocks_within[8].random>
    - define locations <proc[define_curve1].context[<[location]>|<[spawn_at]>|<util.random.int[5].to[15]>|<util.random.int[45].to[180]>|0.8]>
    - foreach <[locations]>:
      - playeffect redstone quantity:10 special_data:5|red offset:0.2 at:<[value]> targets:<server.online_players>
      - wait 2t
    - repeat 3:
      - playeffect redstone quantity:10 special_data:5|red offset:0.7 at:<[spawn_at]> targets:<server.online_players>
      - wait 2t
    - spawn test_spawn_blood_radier <[spawn_at]> target:<[target_player]>

test_spawn_blood_radier:
  type: entity
  debug: false
  entity_type: piglin_brute
  mechanisms:
    custom_name: <&c>Blood Raider
    custom_name_visible: true