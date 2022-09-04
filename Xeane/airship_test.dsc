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

    # Build Old Cuboid
    - define Xeane <server.match_player[Xeane]>
    - define current_location <server.flag[nomad_airship.<[id]>.location]>
    - define pos1 <[current_location].add[-20,-20,-40]>
    - define pos2 <[current_location].add[20,50,40]>
    - define old_cuboid <[pos1].to_cuboid[<[pos2]>]>
    - wait 1t

    # Build New Cuboid
    - execute as_player "rg remove nomad_airship_<[id]>" player:<[Xeane]>
    - define pos1 <[exact_location].add[-20,-20,-40]>
    - define pos2 <[exact_location].add[20,50,40]>
    - define new_cuboid <[pos1].to_cuboid[<[pos2]>]>

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
    - define new_location <[exact_location].add[0,<[highest].add[30]>,0]>
    - define pos1 <[new_location].add[-20,-20,-40]>
    - define pos2 <[new_location].add[20,50,40]>
    - define final_cuboid <[pos1].to_cuboid[<[pos2]>]>
    - adjust <[Xeane]> we_selection:<[final_cuboid]>
    - execute as_player "rg create nomad_airship_<[id]>" player:<[Xeane]>
    - execute as_server "rg flag nomad_airship_<[id]> interact allow"

    # Paste New Airship
    - schematic create area:<[old_cuboid]> name:nomad_airship_<[id]>
    - wait 1t
    - ~schematic paste <[exact_location]> name:nomad_airship_<[id]> delayed

    # Remove Old Airship
    - wait 1t
    - ~modifyblock <[old_cuboid].blocks> air delayed

airship_create:
  type: task
  debug: false
  definitions: id|location
  script:
    - flag server nomad_airship.<[id]>.location:<[location]>
    - schematic paste location:<[location]> name:airship
    - define pos1 <[location].add[-20,-20,-40]>
    - define pos2 <[location].add[20,50,40]>
    - define old_cuboid <[pos1].to_cuboid[<[pos2]>]>
    - define Xeane <server.match_player[Xeane]>
    - adjust <[Xeane]> we_selection:<[final_cuboid]>
    - execute as_player "rg create nomad_airship_<[id]>" player:<[Xeane]>
    - execute as_server "rg flag nomad_airship_<[id]> interact allow"