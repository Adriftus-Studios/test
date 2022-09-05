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
    - if <[highest].add[100]> > 319:
      - narrate "<&c>Unsafe destination for Airship"
      - stop
    
    # Final Cuboid
    - define new_location <[exact_location].with_y[<[highest].add[50]>]>
    - define pos1 <[new_location].add[-20,-20,-40]>
    - define pos2 <[new_location].add[20,50,40]>
    - define final_cuboid <[pos1].to_cuboid[<[pos2]>]>

    # Create Worldguard region
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
    - adjustblock <[new_lever]> switched:true
    - flag <[new_lever]> on_right_click:nomad_airship_toggle_lever
    - flag <[new_lever]> nomad_airship_id:<[id]>

    # Teleport all players
    - foreach <cuboid[nomad_airship_<[id]>_area].players>:
      - define relative <[value].location.sub[<[current_location]>]>
      - teleport <[value]> <[new_location].add[<[relative]>]>

    # Teleport offline players
    - wait 1t
    - foreach <server.flag[nomad_airship.<[id]>.offline_players].if_null[<list>]>:
      - define relative <[value].location.sub[<[current_location]>]>
      - adjust <[value]> location:<[new_location].add[<[relative]>]>

    # Remove Old Airship
    - wait 1t
    - chunkload <server.flag[nomad_airship.<[id]>.chunks]> duration:10s
    - define current_lever <[current_location].add[-3,1,-2]>
    - flag <[current_lever]> on_right_click:!
    - flag <[current_lever]> nomad_airship_id:!
    - ~modifyblock <[old_cuboid].blocks> air delayed

    # Cleanup
    - schematic unload name:nomad_airship_<[id]>
    - flag server nomad_airship.<[id]>.chunks:<[new_cuboid].chunks>

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
    - flag server nomad_airship.<[id]>.chunks:<[cuboid].chunks>
    - adjust <[Xeane]> we_selection:<[cuboid]>
    - note <[cuboid]> as:nomad_airship_<[id]>_area
    - flag <cuboid[nomad_airship_<[id]>_area]> nomad_airship_id:<[id]>
    - flag <cuboid[nomad_airship_<[id]>_area]> player_leaves:nomad_airship_offline_tracker
    - execute as_player "rg create nomad_airship_<[id]>" player:<[Xeane]>
    - execute as_server "rg flag nomad_airship_<[id]> -w <[location].world.name> interact allow"
    - execute as_server "rg flag nomad_airship_<[id]> -w <[location].world.name> chest-access allow"
    - wait 1t
    - ~run airship_create_elevators def:<[id]>

airship_create_elevators:
  type: task
  debug: false
  definitions: id
  script:
    - define location <server.flag[nomad_airship.<[id]>.location]>
    - define elevator1 <[location].add[0,0,-1].highest.center.above[0.51]>
    - define lever_position <[location].add[-3,1,-2]>
    - spawn nomad_airship_elevator_up <[elevator1]> save:elevator_up
    - flag <entry[elevator_up].spawned_entity> nomad_airship_id:<[id]>
    - flag <entry[elevator_up].spawned_entity> nomad_airship_location:<server.flag[nomad_airship.<[id]>.location]>
    - flag server nomad_airship.<[id]>.elevators:|:<entry[elevator_up].spawned_entity>
    - note <[elevator1].to_cuboid[<[location].add[0,0,-1].below>]> as:nomad_airship_<[id]>_elevator_up
    - note <[location].add[0,1,-1].to_cuboid[<[location].add[0,0,-1]>]> as:nomad_airship_<[id]>_elevator_top
    - note <[location].add[0,2,2].to_cuboid[<[location].add[0,-1,2]>]> as:nomad_airship_<[id]>_elevator_down
    - flag <cuboid[nomad_airship_<[id]>_elevator_up]> player_enters:nomad_airship_up
    - flag <cuboid[nomad_airship_<[id]>_elevator_top]> player_enters:nomad_airship_top
    - flag <cuboid[nomad_airship_<[id]>_elevator_down]> player_enters:nomad_airship_down
    - flag <cuboid[nomad_airship_<[id]>_elevator_up]> nomad_airship_id:<[id]>
    - flag <cuboid[nomad_airship_<[id]>_elevator_top]> nomad_airship_id:<[id]>
    - flag <cuboid[nomad_airship_<[id]>_elevator_down]> nomad_airship_id:<[id]>
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


nomad_airship_up:
  type: task
  debug: false
  script:
    - stop if:<server.flag[nomad_airship.<context.area.flag[nomad_airship_id]>.elevator_status].not>
    - wait 1t
    - adjust <player> velocity:0,1,0
    - while <player.location.is_in[<context.area>]> && <player.is_spawned> && !<player.is_sneaking>:
      - adjust <player> velocity:<context.area.center.sub[<player.location>].div[10].with_y[0.6]>
      - wait 1t

nomad_airship_top:
  type: task
  debug: false
  script:
    - stop if:<server.flag[nomad_airship.<context.area.flag[nomad_airship_id]>.elevator_status].not>
    - adjust <player> velocity:<location[-0.1,0.1,0]>

nomad_airship_down:
  type: task
  debug: false
  script:
    - stop if:<server.flag[nomad_airship.<context.area.flag[nomad_airship_id]>.elevator_status].not>
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
    - flag server nomad_airship.<[id]>.elevator_status
    - define location <server.flag[nomad_airship.<[id]>.location]>
    - define blocks_up <cuboid[nomad_airship_<[id]>_elevator_up].blocks.parse[center]>
    - define blocks_up2 <cuboid[nomad_airship_<[id]>_elevator_up].blocks.parse[center]>
    - define blocks_up3 <cuboid[nomad_airship_<[id]>_elevator_up].min.center.below[1.49]>
    - define blocks_down1 <cuboid[nomad_airship_<[id]>_elevator_down].max.center.below[0.8]>
    - define targets <[blocks_up3].find_players_within[120]>
    - while <server.flag[nomad_airship.<[id]>.elevator_status]> && <server.flag[nomad_airship.<[id]>.location]> == <[location]> && <server.flag[nomad_airship.<[id]>.location].chunk.is_loaded>:
      - if <[loop_index].mod[10]> == 0:
        - define targets <[blocks_up3].find_players_within[120]>
      - playeffect <[blocks_up].random[5]> offset:1 effect:DRAGON_BREATH quantity:2 velocity:<location[0,0.2,0]> targets:<[targets]>
      - playeffect <[blocks_up2].random[5]> offset:1 effect:END_ROD quantity:2 velocity:<location[0,0.7,0]> targets:<[targets]>
      - playeffect <[blocks_up3]> offset:0.5,0.1,0.5 effect:DRAGON_BREATH quantity:5 velocity:<location[0,0.7,0]> targets:<[targets]>
      - playeffect <[blocks_down1]> offset:1 effect:DRAGON_BREATH quantity:5 velocity:<location[0,-0.035,0]> targets:<[targets]>
      - playeffect <[blocks_down1]> offset:1 effect:END_ROD quantity:5 velocity:<location[0,-0.2,0]> targets:<[targets]>
      - wait 3t

nomad_airship_toggle_lever:
  type: task
  debug: false
  definitions: id
  script:
    - wait 1t
    - define id <context.location.flag[nomad_airship_id]> if:<[id].exists.not>
    - define lever_location <server.flag[nomad_airship.<[id]>.location].add[-3,1,-2]>
    - if <[lever_location].material.switched>:
      - run nomad_airship_elevator_particles def:<[id]> if:<server.flag[nomad_airship.<[id]>.elevator_status].not>
    - else:
      - flag server nomad_airship.<[id]>.elevator_status:false

nomad_airship_remote_toggle_lever:
  type: task
  debug: false
  definitions: id
  script:
    - define id <context.item.flag[id]> if:<[id].exists.not>
    - define lever_location <server.flag[nomad_airship.<[id]>.location].add[-3,1,-2]>
    - chunkload <[lever_location].chunk> if:<[lever_location].chunk.is_loaded.not>
    - adjustblock <[lever_location]> switched:<[lever_location].material.switched.not>
    - run nomad_airship_toggle_lever def:<[id]>

nomad_airship_offline_tracker:
  type: task
  debug: false
  script:
    - if <context.cause> == QUIT:
      - flag server nomad_airship.<context.area.flag[nomad_airship_id]>.offline_players:->:<player>
    - else if <context.cause> == JOIN:
      - flag server nomad_airship.<context.area.flag[nomad_airship_id]>.offline_players:<-:<player>