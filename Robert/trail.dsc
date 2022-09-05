testing_effects_script:
  type: task
  debug: false
  script:
    - define start <player.location>
    - define end <player.location.backward[20]>
    - define radius 30
    - define angle_offset 0
    - define points <proc[define_spiral].context[<[start]>|<[end]>|<[radius]>|<[angle_offset]>]>
    - foreach <[points]> as:point:
        - playeffect effect:smoke at:<[point]> quantity:5 offset:0 visibility:100
        - wait 1t