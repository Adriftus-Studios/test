level_design_effect_teleport:
  type: data

  # Internal Name for this effect, MUST be Unique
  id: teleport

  # Material To Display in GUIs
  material: ender_pearl

  # Display Name to show in GUIs
  display: <&6>Teleport Player Here

  # Parsed Key for lore in GUIs
  lore:
    - "<&6>Teleports a Player Here"
    - "<&6>Current<&co><&sp><[location].flag[level_design.<[uuid]>.teleport.targets]>"

  # Task to be run when this effect is triggered
  # Can use <[location]> to get the trigger location
  task: level_design_effect_teleport_task

  # Task to run to configure effect
  # Receives a LocationTag as a definition
  config_task: level_design_effect_teleport_config

  # Initializer task - This should initialize any flags for your effect
  # Receives a LocationTag as a definition
  initializer_task: level_design_effect_teleport_initialize

  # Cleanup task - This should remove any flags for your effect
  # DO NOT LEAVE FLAGS LYING AROUND
  # Receives a LocationTag as a definition
  cleanup_task: level_design_effect_teleport_cleanup

level_design_effect_teleport_task:
  type: task
  debug: false
  definitions: location|uuid
  script:
    - teleport <[location].flag[level_design.<[uuid]>.teleport.targets].parsed> <[location].above.center> 

level_design_effect_teleport_initialize:
  type: task
  debug: false
  definitions: loc|uuid
  script:
    - flag <[loc]> level_design.<[uuid]>.teleport.targets:<&lt>player<&gt>

level_design_effect_teleport_cleanup:
  type: task
  debug: false
  definitions: loc|uuid
  script:
    - flag <[loc]> level_design.<[uuid]>.teleport:!

level_design_effect_teleport_config_inventory:
  type: inventory
  debug: false
  inventory: chest
  gui: true
  definitions:
    player_only: <item[green_wool].with[display=<&6>Triggering Player Only;flag=run_script:level_design_effect_teleport_player_only]>
  slots:
    - [level_design_back_to_setting_button] [standard_filler] [standard_filler] [standard_filler] [] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [] [] [player_only] [] [] [] [] [] []

level_design_effect_teleport_player_only:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]> if:<[location].exists.not>
    - define uuid <context.inventory.slot[5].flag[uuid]> if:<[uuid].exists.not>
    - define inv <inventory[level_design_effect_teleport_config_inventory]>
    - flag <[location]> level_design.<[uuid]>.teleport.targets:<&lt>player<&gt>

level_design_effect_teleport_config:
  type: task
  debug: false
  definitions: location|uuid
  script:
    - define location <context.inventory.slot[5].flag[location]> if:<[location].exists.not>
    - define uuid <context.inventory.slot[5].flag[uuid]> if:<[uuid].exists.not>
    - define inv <inventory[level_design_effect_teleport_config_inventory]>
    - inventory set slot:5 d:<[inv]> o:<item[<[location].material.name>].with[display=<[location].simple>;flag=location:<[location]>;flag=uuid:<[uuid]>]>
    - inventory set slot:25 d:<[inv]> "o:<item[green_wool].with[display=<&6>Playres in Range;lore=<&6>Current<&co> <&r><[location].flag[level_design.<[uuid]>.teleport.targets]>;flag=run_script:level_design_effect_teleport_get_input]>"
    - inventory open d:<[inv]>

level_design_effect_teleport_get_input:
  type: task
  debug: false
  script:
    - flag player level_design.set_teleport.uuid:<context.inventory.slot[5].flag[uuid]>
    - flag player level_design.set_teleport.location:<context.inventory.slot[5].flag[location]>
    - run anvil_gui_text_input "def:<&6>Set Mob Spawn|Sets the Mob to be spawned|level_design_effect_teleport_set_targets"

level_design_effect_teleport_set_targets:
  type: task
  debug: false
  definitions: text_input
  script:
    - flag <player.flag[level_design.set_teleport.location]> level_design.<player.flag[level_design.set_teleport.uuid]>.teleport.targets:<&lt>player.location.find_players_within<&lb><[text_input]><&rb><&gt>
    - run level_design_effect_spawn_config def:<player.flag[level_design.set_teleport.location]>|<player.flag[level_design.set_teleport.uuid]>
    - flag <player> level_design:!