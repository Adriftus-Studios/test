armor_stand_test:
  type: task
  debug: false
  definitions: as
  script:
    - define origin <[as].eye_location.below[0.25]>
    - spawn armor_stand[gravity=false] <[origin]> save:as2
    - define as2 <entry[as2].spawned_entity>
    - repeat 10 as:xDiff:
      - define x <util.pi.mul[<[xDiff].div[5]>]>
      - repeat 10 as:yDiff:
        - define y <util.pi.mul[<[yDiff].div[5]>]>
        - repeat 10 as:zDiff:
          - define z <util.pi.mul[<[yDiff].div[5]>]>
          - adjust <[as]> armor_pose:[head=<[x]>,<[y]>,0.0]
          - run armor_stand_teleport def:<[as]>|<[as2]>
          - wait 1t
    - remove <[as2]>

armor_stand_teleport:
  type: task
  debug: false
  definitions: entity|tp_target
  script:
    - define vector <[entity].eye_location.direction.vector>
    - define loc <[entity].eye_location.below[0.25]>
    - define loc_diff <[loc].sub[<[entity].location>]>
    - define as_pose_map <[entity].armor_pose_map.get[head].round_to[2]>
    - define head_direction <proc[armor_stand_get_direction].context[<[as_pose_map].y.mul[-1]>|<[as_pose_map].x>|<[as_pose_map].z.mul[-1]>]>
    - define head_direction <proc[armor_stand_rot_around_y].context[<[head_direction]>|<[entity].location.yaw.mul[-1].to_radians>]>
    - define final_loc <[loc].add[<[head_direction]>]>
    - teleport <[tp_target]> <[final_loc].sub[<[loc_diff]>]>
    - adjust <[tp_target]> armor_pose:[head=<[as_pose_map].add[0,<util.pi>,0]>]

armor_stand_get_direction:
  type: procedure
  debug: true
  definitions: yaw|pitch|roll
  script:
    - define v <location[0,1,0]>
    - define v <[v].proc[armor_stand_rot_around_x].context[<[pitch]>]>
    - define v <[v].proc[armor_stand_rot_around_y].context[<[yaw]>]>
    - define v <[v].proc[armor_stand_rot_around_z].context[<[roll]>]>
    - determine <[v]>

armor_stand_rot_around_x:
  type: procedure
  debug: true
  definitions: vector|angle
  script:
    - define cos <[angle].cos>
    - define sin <[angle].sin>
    - define y <[vector].y.mul[<[cos]>].sub[<[vector].z.mul[<[sin]>]>]>
    - define z <[vector].y.mul[<[sin]>].add[<[vector].z.mul[<[cos]>]>]>
    - determine <[vector].with_y[<[y]>].with_z[<[z]>]>

armor_stand_rot_around_y:
  type: procedure
  debug: true
  definitions: vector|angle
  script:
    - define angle <[angle].mul[-1]>
    - define cos <[angle].cos>
    - define sin <[angle].sin>
    - define x <[vector].x.mul[<[cos]>].sub[<[vector].z.mul[<[sin]>]>]>
    - define z <[vector].x.mul[<[sin]>].add[<[vector].z.mul[<[cos]>]>]>
    - determine <[vector].with_x[<[x]>].with_z[<[z]>]>

armor_stand_rot_around_z:
  type: procedure
  debug: true
  definitions: vector|angle
  script:
    - define cos <[angle].cos>
    - define sin <[angle].sin>
    - define x <[vector].x.mul[<[cos]>].sub[<[vector].y.mul[<[sin]>]>]>
    - define y <[vector].x.mul[<[sin]>].add[<[vector].y.mul[<[cos]>]>]>
    - determine <[vector].with_x[<[x]>].with_y[<[y]>]>
