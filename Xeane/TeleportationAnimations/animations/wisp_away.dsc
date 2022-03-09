teleportation_animation_wisp_away:
  type: data
  # Internal Name, MUST be unique
  name: wisp_away

  # Display Name for Icons
  display: <&6>Wisp Away

  # Material used in menus to represent the animation
  display_material: magma_cream

  # Description for usage in item lore
  description:
  - "<&e>Fly away as a wisp"

  # Does the task take a color as input?
  colorable: true

  # The task for running the animation
  task: teleportation_animation_wisp_away_run


teleportation_animation_wisp_away_run:
  type: task
  debug: false
  definitions: destination|color
  script:
    - define gamemode <player.gamemode>
    - define targets <player.location.find_players_within[100]>
    - define starting_location <player.location>
    - define vector <player.location.add[<[destination].sub[<player.location>]>].normalize>
    - define original_y <player.location.y>
    - repeat 10:
      - playeffect at:<player.location> offset:0.4 effect:redstone special_data:5|<[color]> quantity:30 targets:<[targets]>
      - wait 2t
    - adjust <player> gamemode:spectator
    - repeat 30:
      - playeffect at:<player.location> offset:0.4 effect:redstone special_data:5|<[color]> quantity:30 targets:<[targets]>
      - teleport <player> <[starting_location].add[<[vector].mul[<[value]>]>].with_y[<[original_y].add[<[value]>]>]>
      - wait 2t
    - teleport <player> <[destination].with_y[<[destination].y.add[31]>]>
    - repeat 30:
      - playeffect at:<player.location> offset:0.4 effect:redstone special_data:5|<[color]> quantity:30 targets:<[targets]>
      - teleport <player> <[destination].with_y[<[destination].y.add[<element[31].sub[<[value]>]>]>]>
      - wait 2t
    - adjust <player> gamemode:<[gamemode]>
    - repeat 3:
      - playeffect at:<[destination]> offset:<element[0.7].mul[<[value]>]> effect:redstone special_data:5|<[color]> quantity:<element[30].mul[<[value]>]> targets:<[targets]>
      - wait 1t