teleportation_animation_sky_portal:
  type: data
  # Internal Name, MUST be unique
  name: sky_portal

  # Display Name for Icons
  display: <&6>Sky Portal

  # Material used in menus to represent the animation
  display_material: feather

  # Description for usage in item lore
  description:
  - "<&e>Rise into a portal"

  # Does the task take a color as input?
  colorable: true

  # The task for running the animation
  task: teleportation_animation_sink_run


teleportation_animation_sky_portal_run:
  type: task
  debug: false
  definitions: destination|color
  script:
    - adjust <player> gravity:false
    - define foot_location <player.location>
    - define targets <player.location.find_players_within[60]>
    - repeat 5:
      - playeffect at:<[foot_location]> offset:0.4 effect:redstone special_data:5|<[color]> quantity:30 targets:<[targets]>
      - wait 2t
    - repeat 10:
      - playeffect at:<[foot_location]> offset:0.4 effect:redstone special_data:5|<[color]> quantity:30 targets:<[targets]>
      - teleport <player> <player.location.above[0.2]>
      - wait 2t
    - playeffect at:<[destination]> offset:0.2 effect:redstone special_data:5|<[color]> quantity:10 targets:<[targets]>
    - teleport <player> <[destination]>
    - adjust <player> gravity:true