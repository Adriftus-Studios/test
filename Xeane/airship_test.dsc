# Adds a new type of airship
# filename is the schematic's filename
airship_type:
  type: task
  debug: false
  definitions: filename|type
  script:
    - if !<schematic.list.contains[<[type]>_airship]>:
      - ~schematic load filename:<[filename]> name:<[type]>_airship
    - define id <[type]>_airship
    - stop if:<schematic.list.contains[<[id]>].not>
    - define origin <schematic[<[id]>].origin>
    - flag server airships.data.<[id]>.higher_y:<schematic[<[id]>].height.sub[<[origin].y>]>
    - flag server airships.data.<[id]>.lower_y:-<[origin].y.add[1]>
    - flag server airships.data.<[id]>.higher_x:<schematic[<[id]>].width.sub[<[origin].x>]>
    - flag server airships.data.<[id]>.lower_x:-<[origin].x.add[1]>
    - flag server airships.data.<[id]>.higher_z:<schematic[<[id]>].length.sub[<[origin].z>]>
    - flag server airships.data.<[id]>.lower_z:-<[origin].z.add[1]>
    - flag server airships.data.<[id]>.sailing_height:50
    - flag server airships.data.<[id]>.schematic:<[filename]>
    - flag server airships.data.<[id]>.type:<[type]>

airship_add_elevator_spot:
  type: task
  debug: false
  definitions: airship_type|id|type|location|exit_direction
  data:
    elevator_map:
      location: <[relative_location]>
      type: <[type]>
      exit_direction: <[exit_direction].if_null[none]>
  script:
    - if !<server.has_flag[airships.data.<[airship_type]>_airship]>:
      - narrate "<&c>Unknown Airship Type<&co><&e> <[airship_type]>_airship"
      - stop
    - define relative_location <server.flag[airships.ship.<[id]>.location].sub[<[location]>]>
    - flag server airships.data.<[airship_type]>_airship.elevators.data:->:<script.parsed_key[data.elevator_map]>

airship_set_elevator_lever:
  type: task
  debug: false
  definitions: airship_type|id|location
  data:
    flag_map:
      location: <[relative_location]>
  script:
    - if !<server.has_flag[airships.data.<[airship_type]>_airship]>:
      - narrate "<&c>Unknown Airship Type<&co><&e> <[airship_type]>_airship"
      - stop
    - flag server airships.data.<[airship_type]>_airship.elevator_lever:<server.flag[airships.ship.<[id]>.location].sub[<[location]>]>

airship_add_static_flags:
  type: task
  debug: false
  definitions: airship_type|id|name|value|location
  data:
    flag_map:
      name: <[name]>
      value: <[value]>
      location: <[relative_location]>
  script:
    - if !<server.has_flag[airships.data.<[airship_type]>]>:
      - narrate "<&c>Unknown Airship Type<&co><&e> <[airship_type]>"
      - stop
    - define relative_location <server.flag[airships.ship.<[id]>.location].sub[<[location]>]>
    - flag server airships.data.<[airship_type]>_airship.static_flags:->:<script.parsed_key[data.flag_map]>

airship_add_moving_flags:
  type: task
  debug: false
  definitions: airship_type|id|name|default|location
  data:
    flag_map:
      name: <[name]>
      default_value: <[default]>
      location: <[relative_location]>
  script:
    - if !<server.has_flag[airships.data.<[airship_type]>]>:
      - narrate "<&c>Unknown Airship Type<&co><&e> <[airship_type]>"
      - stop
    - define relative_location <server.flag[airships.ship.<[id]>.location].sub[<[location]>]>
    - flag server airships.data.<[airship_type]>_airship.moving_flags:->:<script.parsed_key[data.flag_map]>

airship_move:
  type: task
  debug: true
  definitions: id|exact_location
  script:
    - if !<server.has_flag[airships.ship.<[id]>]>:
      - narrate "<&c>CRITICAL ERROR - REPORT TO XEANE"
      - stop
    - if <[exact_location].world.name> != <server.worlds.first.name>:
      - narrate "<&c>Cannot move Airship outside of it's world."
      - stop
    - if <[exact_location].distance[<server.flag[airships.ship.<[id]>.location]>]> < 500:
      - narrate "<&c>You cannot move the airship less than 500 blocks"
      - stop
    - if <server.flag[airships.ship.<[id]>.location].world.border_center.distance[<[exact_location]>]> > <server.flag[airships.ship.<[id]>.location].world.border_size.sub[100]>:
      - narrate "<&c>Destination is outside world border."
      - stop

    # Get Schematic Data
    - define type <server.flag[airships.ship.<[id]>.type]>
    - define airship_type <[type]>_airship
    - define current_location <server.flag[airships.ship.<[id]>.location]>
    - define higher_y <server.flag[airships.data.<[airship_type]>.higher_y]>
    - define lower_y <server.flag[airships.data.<[airship_type]>.lower_y]>
    - define higher_x <server.flag[airships.data.<[airship_type]>.higher_x]>
    - define lower_x <server.flag[airships.data.<[airship_type]>.lower_x]>
    - define higher_z <server.flag[airships.data.<[airship_type]>.higher_z]>
    - define lower_z <server.flag[airships.data.<[airship_type]>.lower_z]>
    - define sailing_height <server.flag[airships.data.<[airship_type]>.sailing_height]>

    # Build Old Cuboid
    - define pos1 <[current_location].add[<[lower_x].add[-20]>,<[lower_y].add[-20]>,<[lower_z].add[-20]>]>
    - define pos2 <[current_location].add[<[higher_x].add[20]>,<[higher_y].add[20]>,<[higher_z].add[20]>]>
    - define old_cuboid <[pos1].to_cuboid[<[pos2]>]>
    - wait 1t

    # Build New Cuboid
    - define pos1 <[exact_location].add[<[lower_x].add[-20]>,<[lower_y].add[-20]>,<[lower_z].add[-20]>]>
    - define pos2 <[exact_location].add[<[higher_x].add[20]>,<[higher_y].add[20]>,<[higher_z].add[20]>]>
    - define new_cuboid <[pos1].to_cuboid[<[pos2]>]>

    # Town Check in new cuboid
    - if !<player.has_permission[adriftus.airship.bypass_towny]> && <[new_cuboid].has_town>:
      - narrate "<&c>Too Close to Town to sail to target."
      - stop

    # Determine if viable location
    - define chunks <[new_cuboid].chunks>
    - if <[chunks].filter[is_loaded.not].size> > 1:
      - chunkload <[chunks]> duration:10s
      - wait 1s
    - define highest -64
    - foreach <[chunks]>:
      - define this_high <[value].height_map.highest>
      - if <[this_high]> > <[highest]>:
        - define highest <[this_high]>
      - wait 1t
    - if <[highest].add[<[sailing_height].add[<[lower_y].abs.add[<[higher_y]>]>]>].add[2]> > 319:
      - narrate "<&c>Unsafe destination for Airship"
      - stop

    # Final Cuboid
    - define new_location <[exact_location].with_y[<[highest].add[<[lower_y].abs>].add[<[sailing_height]>]>]>
    - define pos1 <[new_location].add[<[lower_x].add[-20]>,<[lower_y].add[-20]>,<[lower_z].add[-20]>]>
    - define pos2 <[new_location].add[<[higher_x].add[20]>,<[higher_y].add[20]>,<[higher_z].add[20]>]>
    - define final_cuboid <[pos1].to_cuboid[<[pos2]>]>

    # Create Worldguard region
    - adjust <player> we_selection:<[final_cuboid]>
    - execute as_op "rg redefine airship_<[id]>" silent
    - wait 1t

    # Schematic the Ship
    - define schematic_count 0
    - define final_low_y <[old_cuboid].min.y.add[20]>
    - define final_high_y <[old_cuboid].max.y.add[-20]>
    - foreach <[old_cuboid].chunks>:
      - define cuboid <[value].cuboid>
      - define mini_cuboid <[cuboid].min.with_y[<[final_low_y]>].to_cuboid[<[cuboid].max.with_y[<[final_high_y]>]>]>
      - schematic create area:<[mini_cuboid]> name:airship_<[id]>_<[loop_index]> <[current_location]>
      - define schematic_count:++
      - wait 1t
    - flag server airships.ship.<[id]>.location:<[new_location]>
    - flag server airships.ship.<[id]>.last_moved:<util.time_now>

    # Set Movement Data
    - flag server airships.ship.<[id]>.location:<[new_location]>
    - flag server airships.ship.<[id]>.last_moved:<util.time_now>
    # Handle Location Flags
    # Static Flags
    - if <server.has_flag[airships.data.<[airship_type]>.static_flags]>:
      - foreach <server.flag[airships.data.<[airship_type]>.static_flags]> as:map:
        - wait 1t if:<[loop_index].mod[10].equals[0]>
        - flag <[current_location].add[<[map].get[location]>]> <[map].get[name]>:!
        - flag <[new_location].add[<[map].get[location]>]> <[map].get[name]>:<[map].get[value]>

    # Moving Flags
    - if <server.has_flag[airships.data.<[airship_type]>.moving_flags]>:
      - foreach <server.flag[airships.data.<[airship_type]>.moving_flags]> as:map:
        - wait 1t if:<[loop_index].mod[10].equals[0]>
        - define value <[current_location].add[<[map].get[location]>].flag[<[map].get[name]>].if_null[<[map].get[default_value]>]>
        - flag <[current_location].add[<[map].get[location]>]> <[map].get[name]>:!
        - flag <[new_location].add[<[map].get[location]>]> <[map].get[name]>:<[value]>

    # Elevator Lever
    - if <server.has_flag[airships.data.<[airship_type]>.elevator_lever]>:
      - define old_lever <[current_location].add[<server.flag[airships.ship.<[id]>.elevator_lever]>]>
      - define new_lever <[new_location].add[<server.flag[airships.ship.<[id]>.elevator_lever]>]>
      - flag <[old_lever]> on_right_click:!
      - flag <[old_lever]> airship_id:!
      - flag <[new_lever]> on_right_click:airship_toggle_lever
      - flag <[new_lever]> airship_id:<[id]>
    - wait 1t

    # Blind Players at Destination
    - define target_players <[new_location].find_players_within[140]>
    - title title:<&f><&font[adriftus:overlay]><&chr[1004]><&chr[F801]><&chr[1004]> fade_in:5t stay:<[schematic_count].add[10]>t fade_out:1.5s targets:<[target_players]>
    - wait 5t

    # Place Elevators
    - if <server.has_flag[airships.data.<[airship_type]>.elevators.data]>:
      - ~run airship_create_elevators def:<[id]>|<[airship_type]>
      - wait 1t

    # Paste New Airship
    - repeat <[schematic_count]>:
      - schematic paste <[new_location]> name:airship_<[id]>_<[value]> noair
      - wait 1t
    - title title:<&color[#000000]><&font[adriftus:overlay]><&chr[1004]><&chr[F802]><&chr[1004]> fade_in:5t stay:1s fade_out:1.5s targets:<cuboid[airship_<[id]>].players>
    - wait 1t
    - define new_lever <[new_location].add[<server.flag>]>
    - adjustblock <[new_lever]> switched:true
    - flag <[new_lever]> on_right_click:airship_toggle_lever
    - flag <[new_lever]> airship_id:<[id]>
    - wait 5t

    # Teleport all players
    - foreach <cuboid[airship_<[id]>].players>:
      - define relative <[value].location.sub[<[current_location]>]>
      - teleport <[value]> <[new_location].add[<[relative]>].with_pose[<[value]>]>

    # Teleport Other Entities
    - wait 1t
    - foreach <cuboid[airship_<[id]>].entities[!player]>:
      - define relative <[value].location.sub[<[current_location]>]>
      - teleport <[value]> <[new_location].add[<[relative]>].with_pose[<[value]>]>

    # Teleport offline players
    - wait 1t
    - foreach <server.flag[airships.ship.<[id]>.offline_players].if_null[<list>]>:
      - define relative <[value].location.sub[<[current_location]>]>
      - adjust <[value]> location:<[new_location].add[<[relative]>]>

    # Remove Old Airship
    - wait 1t
    - chunkload <server.flag[airships.ship.<[id]>.chunks]> duration:10s
    - title title:<&f><&font[adriftus:overlay]><&chr[1004]><&chr[F802]><&chr[1004]> fade_in:5t stay:<[old_cuboid].chunks.size.mul[2].add[5]>t fade_out:1.5s targets:<[current_location].find_players_within[140]>
    - wait 4t
    - foreach <[old_cuboid].chunks>:
      - define cuboid <[value].cuboid>
      - define mini_cuboid <[cuboid].min.with_y[<[final_low_y]>].to_cuboid[<[cuboid].max.with_y[<[final_high_y]>]>]>
      - modifyblock <[mini_cuboid].blocks[*_carpet|*torch|lever|tripwire_hook|*_bed|lantern|*sign|bell|*azalea|*_door|*_pressure_plate|*_banner]> air no_physics
      - wait 1t
      - modifyblock <[mini_cuboid].blocks[!air]> air
      - wait 1t

    # Cleanup
    - repeat <[schematic_count]>:
      - schematic unload name:airship_<[id]>_<[value]>
      - wait 1t
    - flag server airships.ship.<[id]>.chunks:<[new_cuboid].chunks>
    - note <[final_cuboid]> as:airship_<[id]>
    - flag <cuboid[airship_<[id]>]> airship_id:<[id]>
    - flag <cuboid[airship_<[id]>]> airship_type:<[type]>
    - flag <cuboid[airship_<[id]>]> player_leaves:airship_offline_tracker
    - flag <cuboid[airship_<[id]>]> player_enters:airship_offline_tracker

airship_create:
  type: task
  debug: false
  definitions: type|id|location
  script:
    # Schematic Handling
    - stop if:<server.has_flag[airships.data.<[type]>_airship].not>
    - if !<schematic.list.contains[<[type]>_airship]>:
      - ~schematic load filename:<server.flag[airships.data.<[type]>_airship.schematic]> name:<[type]>_airship
      - wait 1t

    # Defining Data
    - define airship_type <[type]>_airship
    - define sailing_height <server.flag[airships.data.<[airship_type]>.sailing_height]>
    - define higher_y <server.flag[airships.data.<[airship_type]>.higher_y]>
    - define lower_y <server.flag[airships.data.<[airship_type]>.lower_y]>
    - define higher_x <server.flag[airships.data.<[airship_type]>.higher_x]>
    - define lower_x <server.flag[airships.data.<[airship_type]>.lower_x]>
    - define higher_z <server.flag[airships.data.<[airship_type]>.higher_z]>
    - define lower_z <server.flag[airships.data.<[airship_type]>.lower_z]>
    - wait 1t

    # Cuboid Building/Determining Height Map
    - define cuboid <schematic[<[airship_type]>].cuboid[<[location]>]>
    - define chunks <[cuboid].chunks>
    - if <[chunks].filter[is_loaded.not].size> > 1:
      - chunkload <[chunks]> duration:10s
      - wait 1s
    - define highest -64
    - foreach <[chunks]>:
      - define this_high <[value].height_map.highest>
      - if <[this_high]> > <[highest]>:
        - define highest <[this_high]>
      - wait 1t
    - if <[highest].add[<[sailing_height].add[<[lower_y].abs.add[<[higher_y]>]>]>].add[2]> > 319:
      - narrate "<&c>Unsafe location for Airship"
      - stop

    # Build Final Cuboid
    - define new_location <[location].with_y[<[highest].add[<[lower_y].abs>].add[<[sailing_height]>]>]>
    - define pos1 <[new_location].add[<[lower_x].add[-20]>,<[lower_y].add[-20]>,<[lower_z].add[-20]>]>
    - define pos2 <[new_location].add[<[higher_x].add[20]>,<[higher_y].add[20]>,<[higher_z].add[20]>]>
    - define final_cuboid <[pos1].to_cuboid[<[pos2]>]>

    # Setting Server Flags
    - flag server airships.ship.<[id]>.chunks:<[final_cuboid].chunks>
    - flag server airships.ship.<[id]>.location:<[new_location]>
    - flag server airships.ship.<[id]>.elevator_status
    - flag server airships.ship.<[id]>.type:<[type]>

    # Schematic Pasting
    - if <server.has_flag[airships.data.<[airship_type]>.elevators]>:
      - ~run airship_create_elevators def:<[id]>
    - wait 1t
    - ~schematic paste location:<[new_location]> name:<[type]>_airship
    - wait 1t

    # Cuboid Building
    - adjust <player> we_selection:<[final_cuboid]>
    - note <[cuboid]> as:airship_<[id]>
    - flag <cuboid[airship_<[id]>]> airship_id:<[id]>
    - flag <cuboid[airship_<[id]>]> player_leaves:airship_offline_tracker
    - flag <cuboid[airship_<[id]>]> player_enters:airship_offline_tracker

    # World Guard Region
    - execute as_op "rg create airship_<[type]>_<[id]>"
    - execute as_server "rg flag airship_<[type]>_<[id]> -w <[location].world.name> interact allow"
    - execute as_server "rg flag airship_<[type]>_<[id]> -w <[location].world.name> chest-access allow"
    - execute as_server "rg flag airship_<[type]>_<[id]> -w <[location].world.name> town-creation deny"
    - execute as_server "rg flag airship_<[type]>_<[id]> -w <[location].world.name> tnt deny"
    - execute as_server "rg flag airship_<[type]>_<[id]> -w <[location].world.name> fire-spread deny"
    - wait 1t

airship_create_elevators:
  type: task
  debug: false
  definitions: id|airship_type
  script:
    - stop if:<server.has_flag[airships.data.<[airship_type]>.elevators].not>
    - if <server.has_flag[airships.ship.<[id]>.cuboids]>:
      - foreach <server.flag[airships.ship.<[id]>.cuboids]>:
        - note remove as:<[value]>
      - wait 1t
    - define location <server.flag[airships.ship.<[id]>.location]>
    - flag srever airships.ship.<[id]>.elevators.entities:!
    - foreach <server.flag[airships.data.<[airship_type]>.elevators.data]> as:
      - define type <[value].get[type]>
      - define offset <[value].get[location]>
      - if <[type]> == up:
        - define position <[location].add[<[offset]>].highest.center.above[0.51]>
        - spawn airship_elevator_up_entity <[position]> save:this_elevator
        - flag <entry[this_elevator].spawned_entity> airship_id:<[id]>
        - flag <entry[this_elevator].spawned_entity> airship_location:<server.flag[airships.ship.<[id]>.location]>
        - flag server airships.ship.<[id]>.elevators.entities:->:<entry[this_elevator].spawned_entity>
        - note <[position].to_cuboid[<[location].add[<[offset]>].below>]> as:airship_<[id]>_elevator_<[loop_index]>
        - flag <cuboid[airship_<[id]>_elevator_<[loop_index]>]> player_enters:airship_elevator_up
        - flag <cuboid[airship_<[id]>_elevator_<[loop_index]>]> type:up
        - flag <cuboid[airship_<[id]>_elevator_<[loop_index]>]> airship_id:<[id]>
        - flag server airships.ship.<[id]>.cuboids:->:airship_<[id]>_elevator_<[loop_index]>
        - note <[location].add[<[offset]>].to_cuboid[<[location].add[<[offset].above[2]>]>]> as:airship_<[id]>_elevator_<[loop_index]>_top
        - flag <cuboid[airship_<[id]>_elevator_<[loop_index]>_top]> player_enters:airship_elevator_top
        - flag <cuboid[airship_<[id]>_elevator_<[loop_index]>_top]> type:top
        - flag <cuboid[airship_<[id]>_elevator_<[loop_index]>_top]> direction:<[value].get[exit_direction]>
        - flag <cuboid[airship_<[id]>_elevator_<[loop_index]>_top]> airship_id:<[id]>
        - flag server airships.ship.<[id]>.cuboids:->:airship_<[id]>_elevator_<[loop_index]>_top
      - else:
        - define position <[location].add[<[offset]>]>
        - note <[position].to_cuboid[<[position].above[2]>]> as:airship_<[id]>_elevator_<[loop_index]>
        - flag <cuboid[airship_<[id]>_elevator_<[loop_index]>]> player_enters:airship_elevator_down
        - flag <cuboid[airship_<[id]>_elevator_<[loop_index]>]> type:down
        - flag <cuboid[airship_<[id]>_elevator_<[loop_index]>]> airship_id:<[id]>
        - flag server airships.ship.<[id]>.cuboids:->:airship_<[id]>_elevator_<[loop_index]>
      - define final_count <[loop_index]>
      - wait 1t
    - flag server airships.ship.<[id]>.elevators.count:<[final_count]>
    - run airship_elevator_particles def:<[id]>

airship_elevator_up_entity:
  type: entity
  debug: false
  entity_type: armor_stand
  mechanisms:
    marker: true
    visible: false
    gravity: false
  flags:
    on_entity_added: airship_elevator_added
    elevator_type: up


airship_elevator_up:
  type: task
  debug: false
  script:
    - define id <context.area.flag[airship_id]>
    - stop if:<server.flag[airships.ship.<[id]>.elevator_status].not>
    - wait 1t
    - adjust <player> velocity:0,1,0
    - while <player.location.is_in[<context.area>]> && <player.is_spawned> && <server.flag[airships.ship.<[id]>.elevator_status]>:
      - adjust <player> velocity:<context.area.center.sub[<player.location>].div[10].with_y[0.6]>
      - wait 1t

airship_elevator_top:
  type: task
  debug: false
  script:
    - stop if:<server.flag[airships.ship.<context.area.flag[airship_id]>.elevator_status].not>
    - adjust <player> velocity:<context.area.flag[exit_direction]>

airship_elevator_down:
  type: task
  debug: false
  script:
    - stop if:<server.flag[airships.ship.<context.area.flag[airship_id]>.elevator_status].not>
    - cast slow_falling duration:15s

airship_elevator_added:
  type: task
  debug: false
  script:
    - wait 5t
    - if !<context.entity.is_spawned>:
      - stop
    - define id <context.entity.flag[airship_id]>
    - if <context.entity.flag[airship_location]> != <server.flag[airships.ship.<[id]>.location]>:
      - remove <context.entity>
      - stop
    - run airship_elevator_particles def:<[id]>

airship_elevator_particles:
  type: task
  debug: false
  definitions: id
  script:
    - flag server airships.ship.<[id]>.elevator_status
    - define location <server.flag[airships.ship.<[id]>.location]>
    - define up_count 0
    - define down_count 0
    - foreach <server.flag[airships.ship.<[id]>.cuboids]>:
      - choose <[value].flag[type]>:
        - case up:
          - define blocks_up:->:<[value].blocks.parse[center]>
          - define blocks_up_bottom:->:<[value].min.center.below[0.5]>
          - define up_count:++
        - case down:
          - define blocks_down:->:<[value].max.center.below[0.5]>
          - define down_count:++
    - wait 1t
    - define random_final_up <[up_count].mul[5]>
    - define random_final_down <[down_count].mul[5]>
    - define targets <[location].find_players_within[180]>
    - while <server.flag[airships.ship.<[id]>.elevator_status]> && <server.flag[airships.ship.<[id]>.location]> == <[location]> && <server.flag[airships.ship.<[id]>.location].chunk.is_loaded>:
      - if <[loop_index].mod[10]> == 0:
        - define targets <[location].below[50].find_players_within[180]>
      - playeffect <[blocks_up].random[<[random_final_up]>]> offset:1 effect:DRAGON_BREATH quantity:2 velocity:<location[0,0.2,0]> targets:<[targets]>
      - playeffect <[blocks_up].random[<[random_final_up]>]> offset:1 effect:END_ROD quantity:2 velocity:<location[0,0.7,0]> targets:<[targets]>
      - playeffect <[blocks_up_bottom]> offset:0.5,0.1,0.5 effect:DRAGON_BREATH quantity:5 velocity:<location[0,0.7,0]> targets:<[targets]>
      - playeffect <[blocks_down].random[<[random_final_down]>]> offset:1 effect:DRAGON_BREATH quantity:5 velocity:<location[0,-0.035,0]> targets:<[targets]>
      - playeffect <[blocks_down].random[<[random_final_down]>]> offset:1 effect:END_ROD quantity:5 velocity:<location[0,-0.2,0]> targets:<[targets]>
      - wait 3t

airship_toggle_lever:
  type: task
  debug: false
  definitions: id
  script:
    - wait 1t
    - define id <context.location.flag[airship_id]> if:<[id].exists.not>
    - define lever_location <server.flag[airships.ship.<[id]>.lever_location]>
    - if <[lever_location].material.switched>:
      - run airship_elevator_particles def:<[id]> if:<server.flag[airships.ship.<[id]>.elevator_status].not>
    - else:
      - flag server airships.ship.<[id]>.elevator_status:false

airship_remote_toggle_lever:
  type: task
  debug: false
  definitions: id
  script:
    - define id <context.item.flag[id]> if:<[id].exists.not>
    - define lever_location <server.flag[airships.ship.<[id]>.lever_location]>
    - chunkload <[lever_location].chunk> if:<[lever_location].chunk.is_loaded.not>
    - adjustblock <[lever_location]> switched:<[lever_location].material.switched.not>
    - run airship_toggle_lever def:<[id]>

airship_offline_tracker:
  type: task
  debug: false
  script:
    - if <context.cause> == QUIT:
      - flag server airships.ship.<context.area.flag[airship_id]>.offline_players:->:<player>
    - else if <context.cause> == JOIN:
      - flag server airships.ship.<context.area.flag[airship_id]>.offline_players:<-:<player>

ship_command:
  type: command
  name: nomad_ship
  aliases:
  - nms
  usage: /nomad_ship
  description: Nomadic Leaders
  permissions: adriftus.nomad.leader
  data:
    tab_complete:
      2:
        summon: no_arguments
        save: <list>
        toggle: no_arguments
        sail: <player.flag[nomad.leader.locations].keys.if_null[<list>].include[coordinates]>
  tab completions:
    1: save|summon|toggle|sail
    2: <script.parsed_key[data.tab_complete.2.<context.args.get[1]>].if_null[invalid_argument]>
  script:
    - if !<player.has_flag[nomad.leader.id]>:
      - narrate "<&c>Only a Nomadic Leader can use this."
      - stop
    - if <context.args.size> < 1:
      - narrate "<&c>Not enough arguments <&7>- <&e>Use Tab Complete"
    - define id <player.flag[nomad.leader.id]>
    - choose <context.args.first>:
      - case summon:
        - if <player.has_permission[adriftus.nomad.bypass_cooldown]> || !<server.has_flag[nomad_airship.<[id]>.last_moved]> || <server.flag[nomad_airship.<[id]>.last_moved].from_now.in_hours> > 4:
          - narrate "<&a>Summoning Ship..."
          - run airship_move def:<[id]>|<player.location.forward_flat[4]>
        - else:
          - narrate "<&c>You must wait <&e><server.flag[nomad_airship.<[id]>.last_moved].add[4h].from_now.formatted><&c> before moving the ship again."
      - case sail:
        - if !<player.has_permission[adriftus.nomad.bypass_cooldown]> && <server.has_flag[nomad_airship.<[id]>.last_moved]> && <server.flag[nomad_airship.<[id]>.last_moved].from_now.in_hours> < 4:
          - narrate "<&c>You must wait <&e><server.flag[nomad_airship.<[id]>.last_moved].add[4h].from_now.formatted><&c> before moving the ship again."
          - stop
        - if <context.args.size> < 2:
          - narrate "<&c>Not enough arguments <&7>- <&e>Use Tab Complete"
          - stop
        - if <player.flag[nomad.leader.locations].keys.contains[<context.args.get[2]>]>:
          - narrate "<&a>Sailing Ship to <context.args.get[2]>..."
          - run airship_move def:<[id]>|<player.flag[nomad.leader.locations.<context.args.get[2]>]>
          - stop
        - else if <context.args.get[2]> == coordinates:
          - if <context.args.size> < 2 || !<context.args.get[3].is_integer> || !<context.args.get[4].is_integer>:
            - narrate "<&c>Not enough arguments <&7>- <&e>/ship sail coordinates (X) (Z)"
            - stop
          - else:
            - define location <location[<context.args.get[3]>,0,<context.args.get[4]>,<server.flag[nomad_airship.<[id]>.location].world.name>]>
            - narrate "<&a>Sailing Ship to <[location].simple>..."
            - run airship_move def:<[id]>|<[location]>
            - stop
        - else:
          - narrate "<&c>Unknown Destination<&co> <&e><context.args.get[2]>"
      - case toggle:
        - run nomad_airship_remote_toggle_lever def:<[id]>
      - case save:
        - if <context.args.size> < 2:
          - narrate "<&c>Not enough arguments <&7>- <&e>Use Tab Complete"
          - stop
        - flag player nomad.leader.locations.<context.args.get[2]>:<player.location.forward_flat[4]>
        - narrate "<&e>You have saved this location as<&co><&a> <context.args.get[2]>"