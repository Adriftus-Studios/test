armor_stand_test:
  type: task
  debug: false
  definitions: as
  script:
    - define origin <[as].eye_location.below[0.25]>
    - spawn armor_stand[gravity=false] <[origin]> save:as2
    - define as2 <entry[as2].spawned_entity>
    - repeat 20 as:xDiff:
      - define x <util.pi.mul[<[xDiff].div[10]>]>
      - repeat 20 as:yDiff:
        - define y <util.pi.mul[<[yDiff].div[10]>]>
        - repeat 20 as:zDiff:
          - define z <util.pi.mul[<[yDiff].div[10]>]>
          - adjust <[as]> armor_pose:[head=<[x]>,<[y]>,<[z]>]
          - run armor_stand_teleport def:<[as]>|<[x]>|<[y]>|<[z]>|<[as2]>
          - wait 1t
    - remove <[as2]>

armor_stand_teleport:
  type: task
  debug: false
  definitions: entity|x|y|z|tp_target
  script:
    - define vector <[entity].eye_location.direction.vector>
    - define loc <[entity].location>
    - define vector <[loc].direction.vector>
    - define loc <[loc].with_x[<[loc].x.add[<[vector.x].mul[<element[5].div[16]>]>]>]>
    - define loc <[loc].with_y[<[loc].y.add[<element[22].div[16]>]>]>
    - define loc <[loc].with_z[<[loc].z.add[<[vector.x].mul[<element[5].div[16]>]>]>]>
    - define as_pose_map <[entity].armor_pose_map.get[head]>
    - define head_direction <proc[armor_stand_get_direction].context[<[as_pose_map].y>|<[as_pose_map].x>|<[as_pose_map].z.mul[-1]>]>
    - define head_direction <proc[armor_stand_rot_around_y].context[<[head_direction]>|<[entity].location.yaw>]>
    - define new_x <[loc].x.add[<[head_direction].x.mul[<element[10].div[16]>]>]>
    - define new_y <[loc].y.add[<[head_direction].y.mul[<element[10].div[16]>]>]>
    - define new_z <[loc].z.add[<[head_direction].z.mul[<element[10].div[16]>]>]>
    - teleport <[tp_target]> <location[<[new_x]>,<[new_y]>,<[new_z]>,<[entity].world>]>

armor_stand_get_direction:
  type: procedure
  debug: false
  definitions: yaw|pitch|roll
  script:
    - define v <location[0,1,0]>
    - define v <[v].proc[armor_stand_rot_around_x].context[<[pitch]>]>
    - define v <[v].proc[armor_stand_rot_around_y].context[<[yaw]>]>
    - define v <[v].proc[armor_stand_rot_around_y].context[<[roll]>]>
    - determine <[v]>

armor_stand_rot_around_x:
  type: procedure
  debug: false
  definitions: vector|angle
  script:
    - define cos <[angle].cos>
    - define sin <[angle].sin>
    - define y <[vector].y.mul[<[cos]>].sub[<[vector].z.mul[<[sin]>]>]>
    - define z <[vector].y.mul[<[sin]>].add[<[vector].z.mul[<[cos]>]>]>
    - determine <[vector].with_y[<[y]>].with_z[<[z]>]>

armor_stand_rot_around_y:
  type: procedure
  debug: false
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
  debug: false
  definitions: vector|angle
  script:
    - define cos <[angle].cos>
    - define sin <[angle].sin>
    - define x <[vector].x.mul[<[cos]>].sub[<[vector].y.mul[<[sin]>]>]>
    - define y <[vector].x.mul[<[sin]>].add[<[vector].y.mul[<[cos]>]>]>
    - determine <[vector].with_x[<[x]>].with_y[<[y]>]>
