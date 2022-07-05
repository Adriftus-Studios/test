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
      - if <player.town.mayor> == <player>:
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

towny_stick_mayor:
  type: inventory
  inventory: chest
  ti