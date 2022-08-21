armor_stand_test:
  type: task
  debug: false
  definitions: as
  script:
    - define center <[as].eye_location.below[0.25]>
    - spawn armor_stand[gravity=false] <[center]> save:as2
    - define as2 <entry[as2].spawned_entity>
    - repeat 200:
      - define x <util.pi.mul[<[value].div[100]>]>
      - adjust <[as]> armor_pose:[head=<[x]>,0.0,0.0]
      - teleport <[as2]> <[center].add[<location[0,0.5,0].rotate_around_x[<[x]>]>]>
      - wait 1t
    - remove <[as2]>