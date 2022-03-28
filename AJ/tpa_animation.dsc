
teleportation_animation_purple aura:
  type: data
  name: aura_purple
  display: <&5>Purple Aura
  display_material: dragon_breath
  description:
  - "<&e>Fade into a purple aura"
  colorable: false
  task: teleportation_animation_purple_aura_run

teleportation_animation_purple_aura_run:
  type: task
  debug: false
  definitions: destination|color
  script:
  - define points <list[]>
  - repeat 20:
    - define points:|:<proc[define_circle].context[<player.location.with_pitch[90].above[<[value].sub[1].mul[0.1]>]>|0.6|0.1]>
  - playeffect at:<[points]> effect:WITCH_MAGIC offset:0 velocity:0
  - teleport <player> <[destination]>