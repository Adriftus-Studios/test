level_design_effect_spawn:
  type: data
  
  # Internal Name for this effect, MUST be Unique
  id: spawn_mob

  # Material To Display in GUIs
  material: zombie_head

  # Display Name to show in GUIs
  display: <&6>Spawn Mob

  # Task to be run when this effect is triggered
  # Can use <[location]> to get the trigger location
  task: level_design_effect_spawn_task

  # Task to run to configure effect
  # Receives a LocationTag as a definition
  config_task: level_design_effect_spawn_config

  # Initializer task - This should initialize any flags for your effect
  # Receives a LocationTag as a definition
  initializer_task: level_design_effect_spawn_initialize

  # Cleanup task - This should remove any flags for your effect
  # DO NOT LEAVE FLAGS LYING AROUND
  # Receives a LocationTag as a definition
  cleanup_task: level_design_effect_spawn_cleanup

level_design_effect_spawn_task:
  type: task
  debug: false
  definitions: location|uuid
  script:
    - spawn <[location].flag[level_design.spawn.mob].repeat_as_list[<[location].flag[level_design.spawn.count]>]> <[location].above.center>

level_design_effect_spawn_initialize:
  type: task
  debug: false
  definitions: loc|uuid
  script:
    - flag <[loc]> level_design.<[uuid]>.spawn.mob:zombie
    - flag <[loc]> level_design.<[uuid]>.spawn.count:1

level_design_effect_spawn_cleanup:
  type: task
  debug: false
  definitions: loc|uuid
  script:
    - flag <[loc]> level_design.<[uuid]>.spawn.mob:!
    - flag <[loc]> level_design.<[uuid]>.spawn.count:!

level_design_effect_spawn_config_inventory:
  type: inventory
  debug: false
  inventory: chest
  gui: true
  size: 9

level_design_effect_spawn_config:
  type: task
  debug: false
  definitions: loc|uuid
  script:
    - define inv <inventory[level_design_effect_spawn_config_inventory]>
    - inventory set slot:1 d:<[inv]> o:<item[leather_horse_armor]>