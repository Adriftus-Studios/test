large_blood_raid:
  type: task
  debug: false
  definitions: town
  script:
    # Get the home chunk
    - define base <[town].spawn.with_pose[0,0]>

    # Determine valid chunks in range
    - foreach <[town].plots> as:chunk:
      - if <[loop_index].mod[10]>:
        - wait 1t
      - if <[chunk].cuboid.center.distance[<[base]>]> < 200:
        - define valid_chunks:->:<[chunk]>

    # Flag the Town for the raid
    - flag <[town]> blood_raid

    # Start the blood ground animation
    - run large_blood_raid_ground_blood def:<[town]>|<[valid_chunks]>

    # Start the sky animation
    - repeat 5:
      - define yaw_add <element[72].mul[<[value]>]>
      - define location_<[value]> <[base].with_yaw[<[yaw_add]>].above[40].forward[120]>
      - define points_<[value]> <[location_<[value]>].points_between[<[base].above[40]>]>
      - wait 1t
    - define size <[points_1].size>
    - define final_points <list>
    - repeat <[size]>:
      - define final_points <[final_points].include_single[<[points_1].get[<[value]>]>|<[points_2].get[<[value]>]>|<[points_3].get[<[value]>]>|<[points_4].get[<[value]>]>|<[points_5].get[<[value]>]>]>
      - wait 1t
    
    - foreach <[final_points]> as:locations:
      - playeffect at:<[locations]> effect:redstone special_data:10|#660000 offset:0.75 quantity:10 targets:<server.online_players>
      - wait 1t


# Ground Blood During Raid
large_blood_raid_ground_blood:
  type: task
  debug: false
  definitions: town|valid_chunks
  script:

    # get surface blocks in the chunks
    - define surface_blocks <list>
    - foreach <[valid_chunks]>:
      - define surface_blocks:<[surface_blocks].include_single[<[value].surface_blocks>]>
      - wait 1t
    - while <[town].has_flag[blood_raid]>:
      - foreach <[surface_blocks]>:
        - if <[loop_index].mod[8]>:
          - wait 1t
        - playeffect at:<[value].random.above> effect:redstone special_data:10|#660000 offset:0.75 quantity:3 targets:<server.online_players>