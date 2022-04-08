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
    - flag <[loc]> on_step_UUID.<[uuid]>
level_design_trigger_onstep_cleanup:
  type: task
  debug: false
  definitions: loc|UUID
  script:
    - flag <[loc]> on_step:->:level_design_onstep_trigger
    - flag <[loc]> on_step_UUID.<[uuid]>:!

level_design_onstep_trigger:
  type: task
  debug: false
  script:
    - foreach <context.location.flag[on_step_UUID].keys>:
      - run level_design_trigger_location def:<context.location>|<[value]>

level_design_trigger_onstep_config_inventory:
  type: inventory
  debug: false
  inventory: chest
  gui: true
  size: 9

level_design_trigger_onstep_config:
  type: task
  debug: false
  definitions: loc
  script:
    - define inv <inventory[level_design_effect_spawn_config_inventory]>
    - inventory set slot:1 d:<[inv]> o:<item[leather_horse_armor]>