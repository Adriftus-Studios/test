fun_fireball:
  type: task
  debug: false
  script:
  - define map.1 <proc[define_curve1].context[<player.eye_location>|<player.eye_location.forward[3]>|1|45|0.3]>
  - define map.2 <proc[define_curve1].context[<player.eye_location>|<player.eye_location.forward[3]>|1|-90|0.3]>
  - define map.3 <proc[define_curve1].context[<player.eye_location>|<player.eye_location.forward[3]>|1|-45|0.3]>
  - repeat <[map].get[1].size>:
    - playeffect at:<[map].keys.parse_tag[<[map].get[<[parse_value].get[<[value]>]>]>]> effect:FLAME quantity:10 offset:0
    - wait 1t