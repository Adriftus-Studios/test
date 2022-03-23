purple_meteor_shit:
  type: task
  debug: false
  script:
    - define start <player.cursor_on>
    - define end <player.location.above[50].backward_flat[30]>
    - define points <[start].points_between[<[end]>].distance[1]>
    - foreach <[points]>:
      - if <[loop_index].mod[4]>:
        - wait 1t
      - playeffect at:<[value]> effect:REDSTONE special_data:5|purple quantity:100 offset:3 targets:<player>
      - playeffect at:<[value]> effect:dragon_breath  quantity:100 offset:5 targets:<player>