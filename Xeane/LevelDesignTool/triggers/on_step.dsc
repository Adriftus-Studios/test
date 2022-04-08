level_design_trigger_onstep:
  type: data

  # Internal Name for this effect, MUST be Unique
  id: on_step

  # Material To Display in GUIs
  material: leather_boots

  # Display Name to show in GUIs
  display: <&6>Player Steps On

  # Task to run to configure effect
  # Receives a LocationTag as a definition
  config_task: level_design_trigger_onstep_config

  # Initializer task - This should initialize any flags for your effect
  # Receives a LocationTag as a definition
  # This NEEDS to fire "- run level_design_trigger_location def:<[location]>"
  initializer_task: level_design_trigger_onstep_initialize

  # Cleanup task - This should remove any flags for your effect
  # DO NOT LEAVE FLAGS LYING AROUND
  # Receives a LocationTag as a definition
  cleanup_task: level_design_trigger_onstep_cleanup

level_design_trigger_onstep_initialize:
  type: task
  debug: false
  definitions: loc|UUID
  script:
    - flag <[loc]> on_step:|:level_design_onstep_trigger
    - flag <[loc]> level_design.on_step_data.<[uuid]>.setting.uses:1
    - flag <[loc]> level_design.on_step_data.<[uuid]>.setting.per_player:false
    - flag <[loc]> level_design.on_step_data.<[uuid]>.setting.reset_timer:false
    - flag <[loc]> level_design.on_step_data.<[uuid]>.active.uses:1

level_design_trigger_onstep_cleanup:
  type: task
  debug: false
  definitions: loc|UUID
  script:
    - flag <[loc]> on_step:->:level_design_onstep_trigger
    - flag <[loc]> level_design.on_step_data.<[uuid]>:!

level_design_onstep_trigger:
  type: task
  debug: false
  script:
    - ratelimit <player.uuid>_<context.location.simple> 1s
    - foreach <context.location.flag[level_design.on_step_data].keys>:
      - if <context.location.flag[level_design.on_step_data.<[value]>.active.uses]> == -1:
        - run level_design_trigger_location def:<context.location>|<[value]>
      - else if <context.location.flag[level_design.on_step_data.<[value]>.active.uses]> > 0:
        - flag <context.location> level_design.on_step_data.<[value]>.active.uses:-:1
        - run level_design_trigger_location def:<context.location>|<[value]>

level_design_trigger_onstep_config_inventory:
  type: inventory
  debug: false
  inventory: chest
  gui: true
  slots:
    - [level_design_back_to_setting_button] [standard_filler] [standard_filler] [standard_filler] [] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [] [] [] [] [] [] [] [] []

level_design_trigger_onstep_config:
  type: task
  debug: false
  definitions: location|uuid
  script:
    - define location <context.inventory.slot[5].flag[location]> if:<[location].exists.not>
    - define uuid <context.inventory.slot[5].flag[uuid]> if:<[uuid].exists.not>
    - define inv <inventory[level_design_trigger_onstep_config_inventory]>
    - inventory set slot:5 d:<[inv]> o:<item[<[location].material.name>].with[display=<[location].simple>;flag=location:<[location]>;flag=uuid:<[uuid]>]>
    - inventory set slot:19 d:<[inv]> o:<item[green_wool].with[display=<[location].flag[level_design.on_step_data.<[uuid]>.setting.uses]>;flag=run_script:level_design_effect_spawn_onstep_count_input]>
    - inventory open d:<[inv]>

level_design_effect_spawn_onstep_count_input:
  type: task
  debug: false
  script:
    - flag player level_design.set_onstep.uuid:<context.inventory.slot[5].flag[uuid]>
    - flag player level_design.set_onstep.location:<context.inventory.slot[5].flag[location]>
    - run anvil_gui_text_input "def:<&6>Set Mob Spawn|Sets the Mob to be spawned|level_design_effect_spawn_set_onstep"

level_design_effect_spawn_set_onstep:
  type: task
  debug: false
  definitions: text_input
  script:
    - flag <player.flag[level_design.set_onstep.location]> level_design.on_step_data.<player.flag[level_design.set_onstep.uuid]>.setting.uses:<[text_input]>
    - flag <player.flag[level_design.set_onstep.location]> level_design.on_step_data.<player.flag[level_design.set_onstep.uuid]>.active.uses:<[text_input]>
    - run level_design_trigger_onstep_config def:<player.flag[level_design.set_onstep.location]>|<player.flag[level_design.set_onstep.uuid]>
    - flag <player> level_design:!