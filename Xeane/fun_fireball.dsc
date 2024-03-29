fun_fireball:
  type: task
  debug: false
  script:
  - define targets <player.location.find_players_within[100]>
  - define map.1 <proc[define_curve1].context[<player.eye_location>|<player.eye_location.forward[3]>|1.75|45|0.3]>
  - define map.2 <proc[define_curve1].context[<player.eye_location>|<player.eye_location.forward[3]>|1.75|-90|0.3]>
  - define map.3 <proc[define_curve1].context[<player.eye_location>|<player.eye_location.forward[3]>|1.75|135|0.3]>
  - repeat <[map].get[1].size>:
    - playeffect at:<[map].keys.parse_tag[<[map].get[<[parse_value]>].get[<[value]>]>]> effect:FLAME quantity:10 offset:0 targets:<[targets]>
    - wait 1t
  - repeat 10:
    - playeffect at:<player.eye_location.forward[3]> effect:FLAME quantity:10 offset:0.2 targets:<[targets]>
    - wait 1t
  - define points <player.eye_location.forward[3].points_between[<player.eye_location.forward[20]>].distance[0.5]>
  - repeat <[points].size>:
    - if <[value].mod[2]> == 0:
      - wait 1t
    - playeffect at:<[points].get[<[value]>]> effect:flame quantity:5 offset:0.2 targets:<[targets]>