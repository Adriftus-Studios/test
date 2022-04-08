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
    - spawn <[location].flag[level_design.<[uuid]>.spawn.mob].repeat_as_list[<[location].flag[level_design.<[uuid]>.spawn.count]>]> <[location].above.center>

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
  slots:
    - [level_design_back_to_setting_button] [standard_filler] [standard_filler] [standard_filler] [] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [] [] [] [] [] [] [] [] []

level_design_effect_spawn_config:
  type: task
  debug: false
  definitions: location|uuid
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - define uuid <context.inventory.slot[5].flag[uuid]>
    - define inv <inventory[level_design_effect_spawn_config_inventory]>
    - inventory set slot:5 d:<[inv]> o:<item[<[location].material.name>].with[display=<[location].simple>;flag=location:<[location]>;flag=uuid:<[uuid]>]>
    - define item <item[green_wool].with[display=<[location].flag[level_design.<[uuid]>.spawn.mob]>;flag=run_script:level_design_effect_spawn_get_mob_input]>
    - inventory open d:<[inv]>
level_design_effect_spawn_get_mob_input:
  type: task
  debug: false
  script:
    - flag player level_design.set_mob.uuid:<context.inventory.slot[5].flag[uuid]>
    - flag player level_design.set_mob.location:<context.inventory.slot[5].flag[location]>
    - run anvil_gui_text_input "def:<&6>Set Mob Spawn|Sets the Mob to be spawned|level_design_effect_spawn_set_mob"

level_design_effect_spawn_set_mob:
  type: task
  debug: false
  definitions: text_input
  script:
    - flag <player.flag[level_design.set_mob.location]> level_design.<player.flag[level_design.set_mob.uuid]>.spawn.mob:<[text_input]>
    - run level_design_effect_spawn_config def:<player.flag[level_design.set_mob.location]>|<player.flag[level_design.set_mob.uuid]>
    - flag <player> level_design:!