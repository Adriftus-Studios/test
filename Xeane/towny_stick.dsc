towny_stick:
  type: item
  material: stick
  debug: false
  lore:
    - "<&e>Whack people to invite"
    - "<&e>Right Click to assign plots"
  flags:
    right_click_script: towny_stick_use

towny_stick_use:
  type: task
  debug: false
  script:
    - if <player.has_town>:
      - if <player.has_permission[towny.command.plot.asmayor]>:
        - inject towny_stick_mayor_open
      - else:
        - inject towny_stick_resident_open
    - else:
      - inject towny_stick_nomad_open

## Towny Stick Nomad

# Items

towny_stick_nomad_start_town:
  type: item
  debug: false
  material: green_wool
  display name: <&6>Start a Town!
  lore:
    - "<&b>Cost<&co> <&2>$<&e><yaml[towny_config].read[economy.new_expand.price_new_town]>"
  flags:
    run_script: towny_stick_start_town_task

towny_stick_nomad_start_town_info:
  type: item
  debug: false
  material: green_wool
  display name: <&7>Start a Town!
  lore:
    - "<&6>This Chunk is already occupied"
    - "<&7>Move further away."


towny_stick_nomad_join_town:
  type: item
  debug: false
  material: yellow_wool
  display name: <&6>Join a Town!
  flags:
    run_script: cancel

towny_stick_nomad_join_town_info:
  type: item
  debug: false
  material: yellow_wool
  display name: <&7>Join a Town!
  lore:
    - "<&6>Looking for a Home?"
    - "<&7>Find a Town to Join!"

towny_stick_nomad:
  type: inventory
  debug: false
  inventory: chest
  title: <&6>Nomad
  gui: true
  size: 54
  data:
    slots:
      start_town: 1
      join_town: 2
      info_slot: 5

towny_stick_nomad_open:
  type: task
  debug: false
  script:
    - define inventory <inventory[towny_stick_nomad]>
    - define info_script <script[towny_stick_nomad]>
    - inventory set o:feather[custom_model_data=3;display=<&6>Nomad] d:<[inventory]>
    # Start Town Icon
    - if !<player.location.town.exists>:
      - if <player.money> >= <yaml[towny_config].read[economy.new_expand.price_new_town]>:
        - inventory set o:towny_stick_nomad_start_town d:<[inventory]> slot:<[info_script].data_key[data.slots.start_town]>
      - else:
        - define lore "<item[towny_stick_nomad_start_town].lore.include[<&c>You do not have enough Money!]>"
        - inventory set o:towny_stick_nomad_start_town[lore=<[lore]>] d:<[inventory]> slot:<[info_script].data_key[data.slots.start_town]>
    - else:
      - inventory set o:towny_stick_nomad_start_town_info d:<[inventory]> slot:<[info_script].data_key[data.slots.start_town]>
    - if <player.location.town.exists>:
      - inventory set o:towny_stick_nomad_join_town d:<[inventory]> slot:<[info_script].data_key[data.slots.join_town]>
    - else:
      - inventory set o:towny_stick_nomad_join_town_info d:<[inventory]> slot:<[info_script].data_key[data.slots.join_town]>
    - inventory open d:<[inventory]>

towny_stick_start_town_task:
  type: task
  debug: false
  script:
    - if <player.money> >= <yaml[towny_config].read[economy.new_expand.price_new_town]>:
      - run anvil_gui_text_input "def:<&b>Name Your Town!|towny_stick_start_town_callback"

towny_stick_start_town_callback:
  type: task
  debug: false
  definitions: text_input
  script:
    - execute as_player "t new <[text_input]>"


## Towny Stick Mayor

towny_stick_mayor_unclaim:
  type: item
  debug: false
  material: barrier
  display name: <&c>Unclaim Chunk

towny_stick_mayor_claim:
  type: item
  debug: false
  material: green_wool
  display name: <&a>Claim Chunk
  lore:
    - "<&4>Claim This Chunk."

towny_stick_mayor_claim_no_border:
  type: item
  debug: false
  material: green_wool
  display name: <&c>Unclaim Chunk
  lore:
    - "<&4>Unable to Claim."
    - "<&c>Town Must Border Chunk"


towny_stick_mayor:
  type: inventory
  debug: false
  inventory: chest
  title: <&6>Mayor
  gui: true
  size: 54
  data:
    slots:
      chunk_status: 1
      change_owner: 3
      change_plot_type: 4
      toggle_hud: 5
      town_settings: 6
      town_costs: 7
      town_taxes: 8
      residents: 9
      diplomacy: 10
      plot_perms: 11

towny_stick_mayor_open:
  type: task
  debug: false
  script:
    - define inventory <inventory[towny_stick_mayor]>
    - define info_script <script[towny_stick_mayor]>
    - if <player.location.town.exists> && <player.location.town> == <player.town>:
      - inventory set o:towny_stick_mayor_unclaim d:<[inventory]> slot:<[info_script].data_key[data.slots.chunk_status]>
      - inventory set o:towny_stick_mayor_change_plot_owner_open d:<[inventory]> slot:<[info_script].data_key[data.slots.change_owner]>
      - inventory set o:towny_stick_mayor_change_plot_type d:<[inventory]> slot:<[info_script].data_key[data.slots.change_plot_type]>
      - inventory set o:towny_stick_mayor_toggle_hud d:<[inventory]> slot:<[info_script].data_key[data.slots.toggle_hud]>
      - inventory set o:towny_stick_mayor_town_settings d:<[inventory]> slot:<[info_script].data_key[data.slots.town_settings]>
      - inventory set o:towny_stick_mayor_town_costs d:<[inventory]> slot:<[info_script].data_key[data.slots.town_costs]>
      - inventory set o:towny_stick_mayor_town_taxes d:<[inventory]> slot:<[info_script].data_key[data.slots.town_taxes]>
      - inventory set o:towny_stick_mayor_residents d:<[inventory]> slot:<[info_script].data_key[data.slots.residents]>
      - inventory set o:towny_stick_mayor_diplomacy d:<[inventory]> slot:<[info_script].data_key[data.slots.diplomacy]>
      - inventory set o:towny_stick_mayor_outlaw d:<[inventory]> slot:<[info_script].data_key[data.slots.outlaws]>
      - inventory set o:towny_stick_mayor_change_plot_perms d:<[inventory]> slot:<[info_script].data_key[data.slots.change_plot_perms]>
    - else if !<player.location.town.exists>:
      - define chunk <player.location.chunk>
      - define surround <list[<[chunk].add[-1,0]>|<[chunk].add[0,-1]>|<[chunk].add[1,0]>|<[chunk].add[0,1]>]>
      - define borders_town <[surround].parse[cuboid.center.has_town].exclude[false].size>
      - if <[borders_town].size> > 0:
        - inventory set o:towny_stick_mayor_claim d:<[inventory]> slot:<[info_script].data_key[data.slots.chunk_status]>
      - else:
        - inventory set o:towny_stick_mayor_claim_no_border d:<[inventory]> slot:<[info_script].data_key[data.slots.chunk_status]>

towny_stick_mayor_change_plot_owner_evict:
  type: item
  debug: false
  material: barrier
  display name: <&[Deny]>Evict Player

towny_stick_mayor_change_plot_owner_set:
  type: item
  debug: false
  material: player_head

towny_stick_mayor_change_plot_owner:
  type: inventory
  debug: false
  inventory: chest
  size: 54
  gui: true
  data:
    slots:
      evict: 50
      residents: 1|2|3|4|5|6|7|8|9
      back: 46


towny_stick_mayor_change_plot_owner_open:
  type: task
  debug: false
  script:
    - 
