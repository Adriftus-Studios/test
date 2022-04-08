level_design_tool:
  type: item
  debug: false
  material: stick
  display name: <&6><&k>... <&r><&6>Level Design Tool <&k>...
  lore:
  - "<&e>Left Click<&co><&a> Set Trigger/Effect"
  - "<&e>Right Click<&co><&a> Set Placeable"
  flags:
    left_click_script:
    - level_design_open_main_menu
    - cancel

level_design_initializer:
  type: world
  debug: false
  build_stuff:
      - flag server level_design.effects:!|:<server.scripts.filter[container_type.equals[DATA]].filter[name.starts_with[level_design_effect]]>
      - flag server level_design.triggers:!|:<server.scripts.filter[container_type.equals[DATA]].filter[name.starts_with[level_design_trigger]]>
  events:
    on server start:
      - inject locally path:build_stuff
    on script reload:
      - inject locally path:build_stuff

level_design_main_menu:
  type: inventory
  debug: false
  inventory: chest
  gui: true
  slots:
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]

level_design_open_main_menu:
  type: task
  debug: false
  data:
    slots: 10|11|12|13|14|15|16|17|18
    delete_slots: 28|29|30|31|32|33|34|35|36
  definitions: location
  script:
    - define location <context.location> if:<[location].exists.not>
    - define inv <inventory[level_design_main_menu]>
    - inventory set slot:5 d:<[inv]> o:<item[<[location].material.name>].with[display=<[location].simple>;flag=location:<[location]>]>
    - define settings <[location].flag[level_design.settings].keys.if_null[<list>]>
    - foreach <[settings]>:
       - define lore:|:<list[<&b><&l>Triggers<&co>].include[<[location].flag[level_design.settings.<[value]>.triggers].keys.parse[parsed_key[display]]>].include[<&a>|<&a>]>
       - define lore:|:<list[<&b><&l>Effects<&co>].include[<[location].flag[level_design.settings.<[value]>.effects].keys.parse[parsed_key[display]]>].include[<&a>|<&a>]>
       - give <item[green_wool].with[display=<[value]>;lore=<[lore]>;flag=run_script:level_design_open_setting_handle;flag=uuid:<[value]>]> to:<[inv]>
    - if <[settings].size> < 9:
      - give to:<[inv]> <item[<[location].material.name>].with[display=<&a>Add<&sp>Setting;flag=run_script:level_design_add_setting]>
    - inventory open d:<[inv]>

level_design_open_setting_handle:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - if <context.click> == right:
      - run level_designer_remove_setting def:<[location]>|<context.item.flag[uuid]>
      - run level_design_open_main_menu def:<[location]>
    - else:
      - inject level_design_open_setting_menu

level_design_add_setting:
  type: task
  debug: false
  definitions: loc
  script:
    - define loc <context.inventory.slot[5].flag[location]> if:<[loc].exists.not>
    - define uuid <util.random_uuid>
    - run level_design_open_setting_menu def:<[loc]>|<[uuid]>

level_designer_remove_setting:
  type: task
  debug: false
  definitions: location|uuid
  script:
    - define triggers <[location].flag[level_design.settings.<[uuid]>.triggers].keys.if_null[<list>]>
    - define effects <[location].flag[level_design.settings.<[uuid]>.effects].keys.if_null[<list>]>
    - foreach <[triggers]>:
      - run <[value].parsed_key[cleanup_task]> def:<[location]>|<[uuid]>
    - foreach <[effects]>:
      - run <[value].parsed_key[cleanup_task]> def:<[location]>|<[uuid]>
    - flag <[location]> level_design.settings.<[uuid]>:!
    - if <[location].flag[level_design.settings].keys.is_empty.if_null[true]>:
      - flag <[location]> level_design:!

level_design_setting_menu:
  type: inventory
  debug: false
  inventory: chest
  gui: true
  slots:
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [] [] [] [] [] [] [] [] []
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [] [] [] [] [] [] [] [] []
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]

level_design_open_setting_menu:
  type: task
  debug: false
  data:
    location: 5
    trigger_slots: 10|11|12|13|14|15|16|17|18
    effect_slots: 28|29|30|31|32|33|34|35|36
  definitions: loc|uuid
  script:
    - define loc <context.inventory.slot[5].flag[location]> if:<[loc].exists.not>
    - define uuid <context.inventory.slot[5].flag[uuid].if_null[null]> if:<[uuid].exists.not>
    - define uuid <context.item.flag[uuid]> if:<[uuid].equals[null]>
    - define inv <inventory[level_design_setting_menu]>
    - inventory set slot:5 d:<[inv]> o:<item[<[loc].material.name>].with[display=<[location].simple>;flag=location:<[loc]>;flag=uuid:<[uuid]>]>
    - define triggers <[loc].flag[level_design.settings.<[uuid]>.triggers].keys.if_null[<list>]>
    - define effects <[loc].flag[level_design.settings.<[uuid]>.effects].keys.if_null[<list>]>
    - foreach <script.parsed_key[data.trigger_slots]>:
      - if <[triggers].size> < <[loop_index]>:
        - inventory set slot:<[value]> d:<[inv]> o:level_design_add_trigger_button
        - foreach stop
      - else:
        - define script <[triggers].get[<[loop_index]>]>
        - define item <item[<[script].parsed_key[material]>].with[display=<[script].parsed_key[display]>;flag=run_script:level_design_config_or_remove_trigger;flag=script:<[script]>]>
        - inventory set slot:<[value]> d:<[inv]> o:<[item]>
    - foreach <script.parsed_key[data.effect_slots]>:
      - if <[effects].size> < <[loop_index]>:
        - inventory set slot:<[value]> d:<[inv]> o:level_design_add_effect_button
        - foreach stop
      - else:
        - define script <[effects].get[<[loop_index]>]>
        - define item <item[<[script].parsed_key[material]>].with[display=<[script].parsed_key[display]>;flag=run_script:level_design_config_or_remove_effect;flag=script:<[script]>]>
        - inventory set slot:<[value]> d:<[inv]> o:<[item]>
    - inventory open d:<[inv]>

level_design_config_or_remove_trigger:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - define uuid <context.inventory.slot[5].flag[uuid]>
    - if <context.click> == right:
      - run <context.item.flag[script].parsed_key[cleanup_task]> def:<[location]>|<[uuid]>
      - flag <[location]> level_design.settings.<[uuid]>.triggers.<context.item.flag[script]>:!
      - inject level_design_open_setting_menu
    - else:
      - run <context.item.flag[script].parsed_key[config_script]> def:<[location]>|<[uuid]>

level_design_config_or_remove_effect:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - define uuid <context.inventory.slot[5].flag[uuid]>
    - if <context.click> == right:
      - run <context.item.flag[script].parsed_key[cleanup_task]> def:<[location]>|<[uuid]>
      - flag <[location]> level_design.settings.<[uuid]>.effects.<context.item.flag[script]>:!
      - inject level_design_open_setting_menu
    - else:
      - run <context.item.flag[script].parsed_key[config_script]> def:<[location]>|<[uuid]>

level_design_add_inventory:
  type: inventory
  debug: false
  inventory: chest
  gui: true
  slots:
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

level_design_add_trigger_open:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - define uuid <context.inventory.slot[5].flag[uuid]>
    - define inv <inventory[level_design_add_inventory]>
    - inventory set slot:5 d:<[inv]> o:<item[<[location].material.name>].with[display=<[location].simple>;flag=location:<[location]>;flag=uuid:<[uuid]>]>
    - foreach <server.flag[level_design.triggers]> as:script:
      - define item <item[<[script].parsed_key[material]>].with[display=<[script].parsed_key[display]>;flag=run_script:level_design_add_trigger;flag=script:<[script]>]>
      - give to:<[inv]> <[item]>
    - inventory open d:<[inv]>

level_design_add_trigger_button:
  type: item
  debug: false
  material: feather
  display name: <&a>Add Trigger
  flags:
    run_script: level_design_add_trigger_open

level_design_add_trigger:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - define uuid <context.inventory.slot[5].flag[uuid]>
    - run <context.item.flag[script].parsed_key[initializer_task]> def:<[location]>|<[uuid]>
    - flag <[location]> level_design.settings.<[uuid]>.triggers.<context.item.flag[script]>
    - inject level_design_open_setting_menu

level_design_add_effect_open:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - define uuid <context.inventory.slot[5].flag[uuid]>
    - define inv <inventory[level_design_add_inventory]>
    - inventory set slot:5 d:<[inv]> o:<item[<[location].material.name>].with[display=<[location].simple>;flag=location:<[location]>;flag=uuid:<[uuid]>]>
    - foreach <server.flag[level_design.effects]> as:script:
      - define item <item[<[script].parsed_key[material]>].with[display=<[script].parsed_key[display]>;flag=run_script:level_design_add_effect;flag=script:<[script]>]>
      - give to:<[inv]> <[item]>
    - inventory open d:<[inv]>

level_design_add_effect_button:
  type: item
  debug: false
  material: feather
  display name: <&a>Add Effect
  flags:
    run_script: level_design_add_effect_open

level_design_add_effect:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - define uuid <context.inventory.slot[5].flag[uuid]>
    - run <context.item.flag[script].parsed_key[initializer_task]> def:<[location]>|<[uuid]>
    - flag <[location]> level_design.settings.<[uuid]>.effects.<context.item.flag[script]>
    - inject level_design_open_setting_menu

level_design_trigger_location:
  type: task
  debug: false
  definitions: location|uuid
  script:
    - foreach <[location].flag[level_design.settings.<[uuid]>.effects].keys> as:effect_script:
      - run <[effect_script].parsed_key[task]> def:<[location]>|<[uuid]>