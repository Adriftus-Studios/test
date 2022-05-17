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
      - run blood_cult_boss_blood_curve_target def:<server.flag[blood_cult_boss]>
      - wait 5t

blood_cult_boss_blood_curve_target:
  type: task
  debug: false
  definitions: target
  script:
    - define players <location[blood_cult_boss_blood_altar].find_players_within[120]>
    - define blood_altar <location[blood_cult_boss_blood_altar]>
    - define start <location[blood_cult_boss_blood_altar].above[2]>
    - define locations <proc[define_curve1].context[<[start]>|<[target].location>|<util.random.int[5].to[10]>|<util.random.int[60].to[120]>|0.5]>
    - wait 1t
    - repeat 10:
      - playeffect at:<[blood_altar].center.above[<[value].mul[0.2]>]> effect:redstone special_data:1|#990000 offset:0 quantity:5 targets:<[players]>
      - wait 2t
    - foreach <[locations]> as:loc:
      - playeffect at:<[loc]> effect:redstone special_data:1|#990000 offset:0 quantity:5 targets:<[players]>
      - wait 2t
    - repeat 5:
      - playeffect at:<[target].location.above> effect:redstone special_data:1|#990000 offset:0.5,0.5,0.5 quantity:5 targets:<[players]>
      - wait 2t

blood_cult_boss_spawn_wisp:
  type: task
  debug: false
  script:
    - flag <player> dwisp.active.location:<location[blood_cult_boss_blood_altar]>
    - flag <player> "dwisp.data.name:<&4>Blood Wisp"
    - flag <player> dwisp.data.color1:#990000
    - flag <player> dwisp.data.color2:#FF0000
    - flag <player> dwisp.data.behaviour.heal:self
    - flag player dwisp.data.target:monster if:<player.has_flag[dwisp.data.target].not>
    - define targets <player.location.find_players_within[100]>
    - spawn dwisp_armor_stand[custom_name=<player.flag[dwisp.data.name]>] <player.eye_location.above[30]> save:wisp
    - flag player dwisp.active.entity:<entry[wisp].spawned_entity>
    - flag <entry[wisp].spawned_entity> on_entity_added:cancel
    - flag <entry[wisp].spawned_entity> owner:<player>
    - define points <proc[define_curve1].context[<location[blood_cult_boss_blood_altar]>|<player.location.above[5]>|1|90|0.5]>
    - define targets <player.location.find_players_within[100]>
    - foreach <[points]> as:point:
      - teleport <player.flag[dwisp.active.entity]> <[point].below[0.5]>
      - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.5|<player.flag[dwisp.data.color1]> targets:<[targets]>
      - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.75|<player.flag[dwisp.data.color2]> targets:<[targets]>
      - flag player dwisp.active.location:<[point]>
      - wait 2t
    - flag player dwisp.active.task:!
    - run dwisp_run_movement
    - run dwisp_run_behaviour