test_spawn_blood_raiders:
  type: task
  debug: false
  script:
    - define location <player.location.forward[10].above[15]>
    - define players <player.location.find_players_within[100]>
    - foreach <proc[define_curve1].context[<player.location>|<[location]>|5|-90|0.5]>:
      - playeffect redstone quantity:10 special_data:10|red offset:0.2 at:<[value]> targets:<server.online_players>
      - wait 2t
    - repeat 80:
      - playeffect redstone quantity:40 special_data:10|red offset:0.7 at:<[location]> targets:<server.online_players>
      - wait 2t
    - repeat <server.online_players.size.mul[2]>:
      - repeat 10:
        - playeffect redstone quantity:40 special_data:10|red offset:0.7 at:<[location]> targets:<server.online_players>
        - wait 2t
      - run test_spawn_blood_raiders_task def:<[location]>


test_spawn_blood_raiders_task:
  type: task
  debug: false
  definitions: location
  script:
    - define spawn_at <[location].find_spawnable_blocks_within[20].random>
    - define locations <proc[define_curve1].context[<[location]>|<[spawn_at]>|10|45|0.5]>
    - foreach <[locations]>:
      - playeffect redstone quantity:10 special_data:10|red offset:0.2 at:<[value]> targets:<server.online_players>
      - wait 2t
    - spawn test_spawn_blood_radier <[spawn_at]>

test_spawn_blood_radier:
  type: entity
  debug: false
  mechanisms:
    custom_name: <&c>Blood Raider
    custom_name_visible: true