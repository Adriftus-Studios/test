level_design_tool:
  type: item
  debug: false
  material: stick
  display name: <&k>... <&r><&6>Level Design Tool <&k>...
  lore:
  - "<&e>Right Click<&co><&a> Open Menu"
  - "<&e>Left Click<&co><&a> Place Feature"
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
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [] [] [] [] [] [] [] [] []
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
    - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]

level_design_open_main_menu:
  type: task
  debug: false
  data:
    slots: 10|11|12|13|14|15|16|17|18
    delete_slots: 28|29|30|31|32|33|34|35|36
  script:
    - define inv <inventory[level_design_main_menu]>
    - inventory set slot:5 d:<[inv]> o:<item[<context.material>].with[flag=location:<context.location>]>
    - define settings <context.location.flag[level_design.settings].if_null[<list>]>
    - if <[settings].size> < 9:
      - give to:<[inv]> <item[<context.material>].with[flag=run_script:level_design_add_setting]>
    - inventory open d:<[inv]>

level_design_add_setting:
  type: task
  debug: false
  definitions: loc
  script:
    - define loc <context.inventory.slot[5].flag[location]> if:<[loc].exists.not>
    - define uuid <util.random_uuid>
    - run level_design_open_setting_menu def:<[loc]>|<[uuid]>

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
    - define loc <context.inventory.slot[5].flag[uuid]> if:<[uuid].exists.not>
    - define inv <inventory[level_design_setting_menu]>
    - inventory set slot:5 d:<[inv]> o:<item[<[loc].material>].with[flag=location:<[loc]>;flag=uuid:<[uuid]>]>
    - define triggers <context.location.flag[level_design.settings.<[uuid]>.triggers].if_null[<list>]>
    - define effects <context.location.flag[level_design.settings.<[uuid]>.effects].if_null[<list>]>
    - foreach <script.data_key[trigger_slots]>:
      - if <[triggers].size> < <[loop_index]>:
        - inventory set slot:<[value]> d:<[inv]> o:level_design_add_trigger_button
        - foreach stop
      - else:
        - define script <[triggers].get[<[loop_index]>]>
        - define item <item[<[script].data_key[material]>].with[display=<[script].data_key[display]>;flag=run_script:level_design_config_or_remove_trigger;flag=script:<[script]>]>
        - inventory set slot:<[value]> d:<[inv]> o:<[item]>
    - foreach <script.data_key[effect_slots]>:
      - if <[effects].size> < <[loop_index]>:
        - inventory set slot:<[value]> d:<[inv]> o:level_design_add_effect_button
        - foreach stop
      - else:
        - define script <[effects].get[<[loop_index]>]>
        - define item <item[<[script].data_key[material]>].with[display=<[script].data_key[display]>;flag=run_script:level_design_config_or_remove_effect;flag=script:<[script]>]>
        - inventory set slot:<[value]> d:<[inv]> o:<[item]>
    - inventory open d:<[inv]>

level_design_config_or_remove_trigger:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - define uuid <context.inventory.slot[5].flag[uuid]>
    - if <context.click> == right:
      - run <context.item.flag[script].data_key[cleanup_script]> def:<[location]>|<[uuid]>
      - flag <[location]> level_design.settings.<[uuid]>.triggers:->:<context.item.flag[script]>
    - else:
      - run <context.item.flag[script].data_key[config_script]> def:<[location]>|<[uuid]>

level_design_config_or_remove_effect:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - define uuid <context.inventory.slot[5].flag[uuid]>
    - if <context.click> == right:
      - run <context.item.flag[script].data_key[cleanup_script]> def:<[location]>|<[uuid]>
      - flag <[location]> level_design.settings.<[uuid]>.effects:->:<context.item.flag[script]>
    - else:
      - run <context.item.flag[script].data_key[config_script]> def:<[location]>|<[uuid]>

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
    - inventory set slot:5 d:<[inv]> o:<item[<[location].material>].with[flag=location:<[location]>;flag=uuid:<[uuid]>]>
    - foreach <server.flag[level_design.triggers]> as:script:
      - define item <item[<[script].data_key[material]>].with[display=<[script].data_key[display]>;flag=run_script:level_design_add_trigger;flag=script:<[script]>]>
      - give to:<[inv]> <[item]>
    - inventory open d:<[inv]>

level_design_add_trigger_button:
  type: item
  debug: false
  material: feather
  display name: <&a>Add Trigger
  flags:
    run_script: level_design_add_trigger

level_design_add_trigger:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - define uuid <context.inventory.slot[5].flag[uuid]>
    - run <context.item.flag[script].data_key[initializer_task]> def:<[location]>|<[uuid]>
    - flag <[location]> level_design.settings.<[uuid]>.triggers:<-:<context.item.flag[script]>
    - run level_design_open_setting_menu

level_design_add_effect_open:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - define uuid <context.inventory.slot[5].flag[uuid]>
    - define inv <inventory[level_design_add_inventory]>
    - inventory set slot:5 d:<[inv]> o:<item[<[location].material>].with[flag=location:<[location]>;flag=uuid:<[uuid]>]>
    - foreach <server.flag[level_design.effects]> as:script:
      - define item <item[<[script].data_key[material]>].with[display=<[script].data_key[display]>;flag=run_script:level_design_add_effect;flag=script:<[script]>]>
      - give to:<[inv]> <[item]>
    - inventory open d:<[inv]>

level_design_add_effect_button:
  type: item
  debug: false
  material: feather
  display name: <&a>Add Effect
  flags:
    run_script: level_design_add_effect

level_design_add_effect:
  type: task
  debug: false
  script:
    - define location <context.inventory.slot[5].flag[location]>
    - define uuid <context.inventory.slot[5].flag[uuid]>
    - run <context.item.flag[script].data_key[initializer_task]> def:<[location]>|<[uuid]>
    - flag <[location]> level_design.settings.<[uuid]>.effects:<-:<context.item.flag[script]>
    - run level_design_open_setting_menu

level_design_trigger_location:
  type: task
  debug: false
  definitions: location|uuid
  script:
    - foreach <[location].flag[level_design.settings.<[uuid]>.effects]> as:effect_script:
      - run <[effect_script].data_key[task]> def:<[location]>|<[uuid]>