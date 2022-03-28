
test_effects_command:
  type: command
  debug: false
  name: aj_test_animation
  script:
  - define points <list[]>
  - repeat 10:
    - define points:|:<proc[define_circle].context[<player.location.with_pitch[90].above[<[value].sub[1].mul[0.2]>]>|0.7|0.1]>
  - playeffect at:<[points]> effect:WITCH_MAGIC offset:0 velocity:0

# teleportation_animation_sky_portal:
#   type: data
#   # Internal Name, MUST be unique
#   name: sky_portal

#   # Display Name for Icons
#   display: <&6>Sky Portal

#   # Material used in menus to represent the animation
#   display_material: feather

#   # Description for usage in item lore
#   description:
#   - "<&e>Rise into a portal"

#   # Does the task take a color as input?
#   colorable: false

#   # The task for running the animation
#   task: teleportation_animation_sky_portal_run


# teleportation_animation_sky_portal_run:
#   type: task
#   debug: false
#   definitions: destination|color
#   script: