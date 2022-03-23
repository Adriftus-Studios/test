purple_meteor_shit:
  type: task
  debug: false
  script:
    - define end <player.cursor_on>
    - define start <player.location.above[100].forward_flat[30].left[70]>
    - define points <[start].points_between[<[end]>].distance[1]>
    - define targets <player>
    - foreach <[points]>:
      - if <[loop_index].mod[2]> == 0:
        - wait 1t
      - playeffect at:<[value]> effect:REDSTONE special_data:5|purple quantity:100 offset:3 targets:<[targets]>
      - playeffect at:<[value]> effect:dragon_breath quantity:100 offset:5 targets:<[targets]>
    - title title:<&f><&font[adriftus:overlays]><&chr[0004]><&chr[4801]><&chr[0004]> fade_in:1t stay:1s fade_out:8s
    - define boom_spots <[end].find_blocks.within[5].random[10]>
    - foreach <[boom_spots]>:
      - explode <[value]> power:5