large_blood_raid:
  type: task
  debug: false
  definitions: location
  script:
    - define base <[location].with_pose[0,0]>
    - repeat 5:
      - define yaw_add <element[72].mul[<[value]>]>
      - define location_<[value]> <[base].with_yaw[<[yaw_add]>].above[40].forward[60]>
      - define points_<[value]> <[location_<[value]>].points_between[<[base].above[40]>]>
      - wait 1t
    - define final_points <list>
    - repeat <[points_1].size>:
      - define final_points <[final_points].include_single[<[points_1].get[<[value]>]>|<[points_2].get[<[value]>]>|<[points_3].get[<[value]>]>|<[points_4].get[<[value]>]>|<[points_5].get[<[value]>]>]>
      - wait 1t
    - foreach <[final_points]> as:locations:
      - playeffect at:<[locations]> effect:redstone special_data:10|#660000 offset:0.75 quantity:10 targets:<server.online_players>
      - wait 1t