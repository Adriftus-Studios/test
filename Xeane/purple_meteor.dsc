purple_meteor_shit:
  type: task
  debug: false
  script:
    - define end <player.cursor_on>
    - define start <player.location.above[50].forward_flat[30].left[50]>
    - define points <[start].points_between[<[end]>].distance[1]>
    - foreach <[points]>:
      - if <[loop_index].mod[4]> == 0:
        - wait 1t
      - playeffect at:<[value]> effect:REDSTONE special_data:5|purple quantity:100 offset:3 targets:<player>
      - playeffect at:<[value]> effect:dragon_breath  quantity:100 offset:5 targets:<player>