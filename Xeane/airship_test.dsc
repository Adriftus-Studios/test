airship_move:
  type: task
  debug: false
  definitions: id|exact_location
  script:
    - if !<server.has_flag[nomad_airship.<[id]>]>:
      - narrate "<&c>CRITICAL ERROR - REPORT TO XEANE"
      - stop
    - if !<server.match_player[Xeane].exists>:
      - narrate "<&c>Unable to move Airship at this time"
      - stop
    - if <[exact_location].world.name> != <server.worlds.first.name>:
      - narrate "<&c>Cannot move Airship outside of it's world."
    - if <[exact_location].distance[<server.flag[nomad_airship.<[id]>.location]>]> < 500:
      - narrate "<&c>You cannot move the airship less than 500 blocks"
      - stop

    # Build Old Cuboid
    - define Xeane <server.match_player[Xeane]>
    - define current_location <server.flag[nomad_airship.<[id]>.location]>
    - define pos1 <[current_location].add[-20,-20,-50]>
    - define pos2 <[current_location].add[20,50,40]>
    - define old_cuboid <[pos1].to_cuboid[<[pos2]>]>
    - wait 1t

    # Build New Cuboid
    - execute as_player "rg remove nomad_airship_<[id]>" player:<[Xeane]>
    - define pos1 <[exact_location].add[-20,-20,-40]>
    - define pos2 <[exact_location].add[20,50,40]>
    - define new_cuboid <[pos1].to_cuboid[<[pos2]>]>

    # Town Check in new cuboid
    - if <[new_cuboid].has_town>:
      - narrate "<&c>Too Close to Town to sail to target."
      - stop

    # Determine if viable location
    - define chunks <[new_cuboid].chunks>
    - chunkload <[chunks]> duration:10s
    - wait 1t
    - define highest -64
    - foreach <[chunks]>:
      - define this_high <[value].height_map.highest>
      - if <[this_high]> > <[highest]>:
        - define highest <[this_high]>
      - wait 1t
    - if <[highest].add[80]> > 319:
      - narrate "<&c>Unsafe destination for Airship"
      - stop
    - define new_location <[exact_location].with_y[<[highest].add[30]>]>
    - define pos1 <[new_location].add[-20,-20,-40]>
    - define pos2 <[new_location].add[20,50,40]>
    - define final_cuboid <[pos1].to_cuboid[<[pos2]>]>
    - adjust <[Xeane]> we_selection:<[final_cuboid]>
    - execute as_player "rg create nomad_airship_<[id]>" player:<[Xeane]>
    - wait 1t
    - execute as_server "rg flag nomad_airship_<[id]> -w <[new_location].world.name> interact allow"
    - execute as_server "rg flag nomad_airship_<[id]> -w <[new_location].world.name> chest-access allow"

    # Paste New Airship
    - schematic create area:<[old_cuboid]> name:nomad_airship_<[id]> <[current_location]>
    - wait 1t
    - flag server nomad_airship.<[id]>.location:<[new_location]>
    - ~run airship_create_elevators def:<[id]>
    - wait 1t
    - ~schematic paste <[new_location]> name:nomad_airship_<[id]> delayed
    - wait 1t
    - define new_lever <[new_location].add[-3,1,-2]>
    - flag <[new_lever]> on_right_click:nomad_airship_toggle_lever
    - flag <[new_lever]> nomad_airship_id:<[id]>

    # Remove Old Airship
    - wait 1t
    - define current_lever <[current_location].add[-3,1,-2]>
    - flag <[current_lever]> on_right_click:!
    - flag <[current_lever]> nomad_airship_id:!
    - ~modifyblock <[old_cuboid].blocks> air delayed

    # Cleanup
    - schematic unload name:nomad_airship_<[id]>

airship_create:
  type: task
  debug: false
  definitions: id|location
  script:
    - flag server nomad_airship.<[id]>.location:<[location]>
    - schematic paste location:<[location]> name:airship
    - define pos1 <[location].add[-20,-20,-40]>
    - define pos2 <[location].add[20,50,40]>
    - define cuboid <[pos1].to_cuboid[<[pos2]>]>
    - define Xeane <server.match_player[Xeane]>
    - adjust <[Xeane]> we_selection:<[cuboid]>
    - execute as_player "rg create nomad_airship_<[id]>" player:<[Xeane]>
    - execute as_server "rg flag nomad_airship_<[id]> -w <[location].world.name> interact allow"
    - execute as_server "rg flag nomad_airship_<[id]> -w <[location].world.name> chest-access allow"

airship_create_elevators:
  type: task
  debug: false
  definitions: id
  script:
    - define location <server.flag[nomad_airship.<[id]>.location]>
    - define elevator1 <[location].add[0,0,-1].highest.center.above[0.51]>
    - define elevator2 <[location].add[0,0,2].highest.center.above[0.51]>
    - define lever_position <[location].add[-3,1,-2]>
    - flag server nomad_airship.<[id]>.elevator_status
    - spawn nomad_airship_elevator_up <[elevator1]> save:elevator_up
    - spawn nomad_airship_elevator_down <[elevator2]> save:elevator_down
    - flag <entry[elevator_up].spawned_entity>|<entry[elevator_down].spawned_entity> nomad_airship_id:<[id]>
    - flag <entry[elevator_up].spawned_entity>|<entry[elevator_down].spawned_entity> nomad_airship_location:<server.flag[nomad_airship.<[id]>.location]>
    - flag server nomad_airship.<[id]>.elevators:|:<entry[elevator_up].spawned_entity>|<entry[elevator_down].spawned_entity>
    - note <[elevator1].to_cuboid[<[location].add[0,0,-1].below>]> as:nomad_airship_<[id]>_elevator_up
    - note <[elevator2].to_cuboid[<[location].add[0,0,2]>]> as:nomad_airship_<[id]>_elevator_down
    - flag <cuboid[nomad_airship_<[id]>_elevator_up]> player_enters:nomad_airship_up
    - flag <cuboid[nomad_airship_<[id]>_elevator_down]> player_enters:nomad_airship_down
    - run nomad_airship_elevator_particles def:<[id]>

nomad_airship_elevator_up:
  type: entity
  debug: false
  entity_type: armor_stand
  mechanisms:
    marker: true
    visible: false
    gravity: false
  flags:
    on_entity_added: nomad_airship_elevator_added
    elevator_type: up

nomad_airship_elevator_down:
  type: entity
  debug: false
  entity_type: armor_stand
  mechanisms:
    marker: true
    visible: false
    gravity: false
  flags:
    on_entity_added: nomad_airship_elevator_added
    elevator_type: down

nomad_airship_up:
  type: task
  debug: false
  script:
    - announce FIRED
    - wait 1t
    - adjust <player> velocity:0,1,0
    - while <player.location.is_in[<context.area>]> && <player.is_spawned> && !<player.is_sneaking>:
      - adjust <player> velocity:<context.area.center.sub[<player.location>].div[10].with_y[0.6]>
      - wait 1t

nomad_airship_down:
  type: task
  debug: false
  script:
    - announce FIRED
    - cast slow_falling duration:15s

nomad_airship_elevator_added:
  type: task
  debug: false
  script:
    - wait 5t
    - if !<context.entity.is_spawned>:
      - stop
    - define id <context.entity.flag[nomad_airship_id]>
    - if <context.entity.flag[nomad_airship_location]> != <server.flag[nomad_airship.<[id]>.location]>:
      - remove <context.entity>
      - stop
    - run nomad_airship_elevator_particles def:<[id]>

nomad_airship_elevator_particles:
  type: task
  debug: false
  definitions: id
  script:
    - define location <server.flag[nomad_airship.<[id]>.location]>
    - define blocks_up <cuboid[nomad_airship_<[id]>_elevator_up].blocks.parse[center]>
    - define blocks_up2 <cuboid[nomad_airship_<[id]>_elevator_up].blocks.parse[center]>
    - define blocks_up3 <cuboid[nomad_airship_<[id]>_elevator_up].min.center.below[1.49]>
    - define blocks_down1 <cuboid[nomad_airship_<[id]>_elevator_down].blocks.parse[center]>
    - define blocks_down2 <cuboid[nomad_airship_<[id]>_elevator_down].blocks.parse[center]>
    - define blocks_up3 <cuboid[nomad_airship_<[id]>_elevator_up].max.center.above[1.49]>
    - define targets <[blocks_up3].find_players_within[120]>
    - while <server.flag[nomad_airship.<[id]>.elevator_status]> && <server.flag[nomad_airship.<[id]>.location]> == <[location]> && <server.flag[nomad_airship.<[id]>.location].chunk.is_loaded>:
      - if <[loop_index].mod[10]> == 0:
        - define targets <[blocks_up3].find_players_within[120]>
      - playeffect <[blocks_up].random[5]> offset:1 effect:DRAGON_BREATH quantity:2 velocity:<location[0,0.7,0]> targets:<[targets]>
      - playeffect <[blocks_up2].random[5]> offset:1 effect:END_ROD quantity:2 velocity:<location[0,0.7,0]> targets:<[targets]>
      - playeffect <[blocks_up3]> offset:0.5,0.1,0.5 effect:DRAGON_BREATH quantity:5 velocity:<location[0,0.7,0]> targets:<[targets]>
      - playeffect <[blocks_down1].random[2]> offset:1 effect:DRAGON_BREATH quantity:2 velocity:<location[0,-0.7,0]> targets:<[targets]>
      - playeffect <[blocks_down2].random[2]> offset:1 effect:END_ROD quantity:2 velocity:<location[0,-0.7,0]> targets:<[targets]>
      - playeffect <[blocks_up3]> offset:0.5,0.1,0.5 effect:DRAGON_BREATH quantity:5 velocity:<location[0,-0.7,0]> targets:<[targets]>
      - wait 3t