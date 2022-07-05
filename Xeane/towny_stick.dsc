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
    - inventory set o:feather[custom_model_data=3;display=<&6>Nomad]
    # Start Town Icon
    - if !<player.location.town.exists>:
      - inventory set o:towny_stick_nomad_start_town slot:<[info_script].data_key[data.slots.start_town]>
    - else:
      - inventory set o:towny_stick_nomad_start_town_info slot:<[info_script].data_key[data.slots.start_town]>
    - if <player.location.town.exists>:
      - inventory set o:towny_stick_nomad_join_town slot:<[info_script].data_key[data.slots.join_town]>
    - else:
      - inventory set o:towny_stick_nomad_join_town_info slot:<[info_script].data_key[data.slots.join_town]>

towny_stick_start_town_task:
  type: task
  debug: false
  script:
    - run anvil_gui_callback_example "def:<&color[#000001]>Name Your Town!|<&6>Name your Town|towny_stick_start_town_callback"

towny_stick_start_town_callback:
  type: task
  debug: false
  definitions: text_input
  script:
    - execute as_player "t new <[text_input]>"
