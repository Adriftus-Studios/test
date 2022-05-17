blood_cult_boss_start:
  type: task
  debug: false
  script:
    - define players <location[blood_cult_boss_blood_altar].find_players_within[120]>
    - repeat 120:
      - define offset <[value].div[20]>
      - playeffect at:blood_cult_boss_blood_altar effect:redstone special_data:<[value].div[10]>|#990000 offset:<[offset]> quantity:20 targets:<[players]>
      - wait 2t
    - define players <location[blood_cult_boss_blood_altar].find_players_within[120]>
    - repeat 6:
      - run blood_cult_boss_blood_curve_target def:<server.flag[blood_cult_boss].location.above>

blood_cult_boss_blood_curve_target:
  type: task
  debug: false
  definitions: target
  script:
    - define players <location[blood_cult_boss_blood_altar].find_players_within[120]>
    - define blood_altar <location[blood_cult_boss_blood_altar]>
    - define start <location[blood_cult_boss_blood_altar].above[2]>
    - define locations <proc[define_curve1].context[<[start]>|<[target].location>|<util.random.int[5].to[10]>|<util.random.int[80].to[100]>|1]>
    - wait 1t
    - repeat 10:
      - playeffect at:<[start].center.above[<[value].mul[0.2]>]> effect:redstone special_data:10|#990000 offset:1,0,1 quantity:5 targets:<[players]>
      - wait 2t
    - foreach <[locations]> as:loc:
      - playeffect at:<[loc]> effect:redstone special_data:10|#990000 offset:0.25 quantity:5 targets:<[players]>
      - wait 2t
    - repeat 5:
      - playeffect at:<[target].location.above> effect:redstone special_data:10|#990000 offset:0.5,0.5,0.5 quantity:5 targets:<[players]>
      - wait 2t