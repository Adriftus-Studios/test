armor_stand_test:
  type: task
  debug: false
  definitions: as
  script:
    - define center <[as].eye_location.below[0.25]>
    - spawn armor_stand[gravity=false] <[center]> save:as2
    - define as2 <entry[as2].spawned_entity>
    - repeat 200 as:xDiff:
      - define x <util.pi.mul[<[xDiff].div[100]>]>
      - repeat 200 as:yDiff:
        - define y <util.pi.mul[<[yDiff].div[100]>]>
        - adjust <[as]> armor_pose:[head=<[x]>,<[y]>,0.0]
        - teleport <[as2]> <[center].add[<location[0,0.5,0].rotate_around_x[<[x]>]>].add[<location[0,0.5,0].rotate_around_y[<[y]>]>]>
        - wait 1t
    - remove <[as2]>