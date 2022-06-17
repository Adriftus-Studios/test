custom_object_waystone_town:
  type: data
  item: waystone_town
  entity: waystone_entity
  interaction: waystone_use
  place_checks_task: waystone_place_town_checks
  after_place_task: waystone_after_place_town
  remove_task: waystone_remove
  barrier_locations:
    - <[location]>
    - <[location].above>

custom_object_waystone_server:
  type: data
  item: waystone_server
  entity: waystone_entity
  interaction: waystone_use
  place_checks_task: waystone_place_server_checks
  after_place_task: waystone_after_place_server
  remove_task: waystone_remove
  barrier_locations:
    - <[location]>
    - <[location].above>

custom_object_waystone_wild:
  type: data
  item: waystone_wild
  entity: waystone_entity
  interaction: waystone_use
  place_checks_task: waystone_place_wild_checks
  after_place_task: waystone_after_place_wild
  remove_task: waystone_remove
  barrier_locations:
    - <[location]>
    - <[location].above>

waystone_town:
  type: item
  material: feather
  mechanisms:
    custom_model_data: 20
  flags:
    right_click_script: custom_object_place
    custom_object: waystone_town
    type: town

waystone_wild:
  type: item
  material: feather
  mechanisms:
    custom_model_data: 20
  flags:
    right_click_script: custom_object_place
    custom_object: waystone_wild
    type: wild

waystone_server:
  type: item
  material: feather
  mechanisms:
    custom_model_data: 20
  flags:
    right_click_script: custom_object_place
    custom_object: waystone_server
    type: server

waystone_entity:
  type: entity
  debug: false
  entity_type: armor_stand
  mechanisms:
    custom_name_visible: true
    visible: false
    gravity: false
    equipment:
      helmet: feather[custom_model_data=20]
  flags:
    on_entity_added: custom_object_update

waystone_place_wild_checks:
  type: task
  debug: false
  script:
    - ratelimit <player> 1t
    - if !<player.has_permission[adriftus.waystone.wild.place]>:
      - narrate "<&c>You lack the permission to place a wild waystone."
      - stop

waystone_after_place_wild:
  type: task
  debug: false
  definitions: entity
  script:
    - flag server waystones.wild.<[entity].uuid>.location:<player.location.with_pose[0,<player.location.yaw.sub[180]>]>
    - flag server waystones.wild.<[entity].uuid>.name:<[entity].uuid>
    - flag <[entity]> type:wild

waystone_place_server_checks:
  type: task
  debug: false
  script:
    - ratelimit <player> 1t
    - if !<player.has_permission[adriftus.waystone.server.place]>:
      - narrate "<&c>You lack the permission to place a server waystone."
      - stop

waystone_after_place_server:
  type: task
  debug: false
  definitions: entity
  script:
    - flag server waystones.server.<[entity].uuid>.location:<player.location.with_pose[0,<player.location.yaw.sub[180]>]>
    - flag server waystones.server.<[entity].uuid>.name:<[entity].uuid>
    - flag <[entity]> type:server

waystone_place_town_checks:
  type: task
  debug: false
  script:
    - ratelimit <player> 1t
    - if !<[location].town.exists>:
      - narrate "<&c>Waystones must be placed in a town."
      - stop
    - if <player> != <[location].town.mayor>:
      - narrate "<&c>Waystones must be placed by the Mayor."
      - stop
    - if <[location].town.has_flag[waystone]>:
      - narrate "<&c>You can only have one waystone in your Town"
      - stop

waystone_after_place_town:
  type: task
  debug: false
  definitions: entity
  script:
    - define town <[location].town>
    - flag <[town]> waystone.entity:<[entity]>
    - flag <[town]> waystone.location:<[entity].location.simple>
    - flag <[town]> waystone.tp_location:<player.location.with_pose[0,<player.location.yaw.sub[180]>]>
    - flag <[entity]> town:<context.location.town>
    - flag <[entity]> type:town
    - adjust <[entity]> "custom_name:<[location].town.name> Waystone"

waystone_use:
  type: task
  debug: false
  definitions: entity
  script:
    - determine passively cancelled
    - define entity <context.location.flag[custom_object]> if:<[entity].exists.not>
    - choose <[entity].flag[type]>:
      - case town:
        - if <player.has_flag[waystones.town.<[entity].flag[town]>]>:
          - inject waystone_open_teleport_main_menu
        - else:
          - run totem_test def:2
          - title "title:<&a>Waystone Unlocked!" fade_in:1s stay:1s fade_out:1s
          - flag <player> waystones.town.<[entity].flag[town]>.location:<[entity].location.simple>
          - flag <player> waystones.town.<[entity].flag[town]>.entity_uuid:<[entity].uuid>
          - flag <[entity]> unlocked_players:->:<player>
      - case server:
        - inject waystone_open_teleport_main_menu
      - case wild:
        - if <player.has_flag[waystones.wild.<[entity].uuid>]>:
          - inject waystone_open_teleport_main_menu
        - else:
          - run totem_test def:2
          - title "title:<&a>Waystone Unlocked!" fade_in:1s stay:1s fade_out:1s
          - flag <player> waystones.wild.<[entity].uuid>.location:<[entity].location.simple>
          - flag <[entity]> unlocked_players:->:<player>

waystone_remove:
  type: task
  debug: false
  script:
    - choose <context.item.flag[type]>:
      - case town:
        - define town <context.item.flag[town]>
        - define entity <context.item.flag[entity]>
        - foreach <[town].flag[waystone.entity].flag[unlocked_players]>:
          - flag <[value]> waystones.town.<[town]>:!
        - flag <[town]> waystone:!
      - case server:
        - define entity <context.item.flag[entity]>
        - flag server waystones.server.<[entity].uuid>:!
      - case wild:
        - define entity <context.item.flag[entity]>
        - foreach <[entity].flag[unlocked_players]>:
          - flag <[value]> waystones.wild.<[entity].uuid>:!
        - flag server waystones.wild.<[entity].uuid>:!
    - run custom_object_remove def:<[entity]>
    - inventory close

waystone_gui_item:
  type: item
  material: feather
  display name: <&c>PLACEHOLDER
  mechanisms:
    custom_model_data: 20
  flags:
    run_script: waystone_teleport

waystone_submenu_item:
  type: item
  material: feather
  display name: <&c>PLACEHOLDER
  mechanisms:
    custom_model_data: 3
  flags:
    run_script: waystone_open_teleport_submenu

waystone_teleport:
  type: task
  debug: false
  script:
    - run teleportation_animation_run def:<context.item.flag[location]>

waystone_open_teleport_submenu:
  type: task
  debug: false
  script:
    - run waystone_open_teleport_<context.item.flag[type]>_menu

waystone_teleport_menu:
  type: inventory
  inventory: chest
  size: 54
  title: <&a>Waystones
  gui: true

waystone_remove_item:
  type: item
  material: barrier
  display name: <&c>Remove Waystone
  flags:
    run_script: waystone_remove

waystone_rename_item:
  type: item
  material: name_tag
  display name: <&b>Rename Waystone
  flags:
    run_script: waystone_rename

waystone_open_teleport_town_menu:
  type: task
  debug: false
  script:
    - define inventory <inventory[waystone_teleport_menu]>
    - foreach <player.flag[waystones.town]> key:town as:value:
      - if <[loop_index].mod[45]> == 0:
        - foreach stop
      - if !<town[<[town]>].exists>:
        - flag <player> waystones.town.<[town]>:!
        - foreach next
      - if <player.flag[waystones.town.<[town]>.location]> != <town[<[town]>].flag[waystone.location]>:
        - flag <player> waystones.town.<[town]>:!
        - foreach next
      - give waystone_gui_item[flag=location:<[town].flag[waystone.tp_location]>;display=<town[<[town]>].name>] to:<[inventory]>
    - inventory open d:<[inventory]>

waystone_open_teleport_server_menu:
  type: task
  debug: false
  script:
    - define inventory <inventory[waystone_teleport_menu]>
    - foreach <server.flag[waystones.server]> as:data_map:
      - give waystone_gui_item[flag=location:<[data_map].get[location]>;display=<[data_map].get[name]>] to:<[inventory]>
    - inventory open d:<[inventory]>

waystone_open_teleport_wild_menu:
  type: task
  debug: false
  script:
    - define inventory <inventory[waystone_teleport_menu]>
    - foreach <server.flag[waystones.wild]> as:data_map:
      - give waystone_gui_item[flag=location:<[data_map].get[location]>;display=<[data_map].get[name]>] to:<[inventory]>
    - inventory open d:<[inventory]>

waystone_open_teleport_main_menu:
  type: task
  debug: false
  definitions: entity
  script:
    - define entity <context.location.flag[entity]> if:<[entity].exists.not>
    - define inventory <inventory[waystone_teleport_menu]>
    - give waystone_submenu_item[display=Towns;flag=type:town] to:<[inventory]>
    - give waystone_submenu_item[display=Server;flag=type:server] to:<[inventory]>
    - give waystone_submenu_item[display=Wild;flag=type:wild] to:<[inventory]>
    # Remove Waystone Button
    - if <[entity].flag[type]> == town && <player> == <[entity].flag[town].mayor>:
      - inventory set slot:50 o:waystone_remove_item[flag=type:<[entity].flag[type]>;flag=town:<[entity].flag[town]>;flag=entity:<[entity]>] d:<[inventory]>
    - else if <player.has_permission[adriftus.waystone.<[entity].flag[type]>.remove]>:
      - inventory set slot:50 o:waystone_remove_item[flag=type:<[entity].flag[type]>;flag=entity:<[entity]>] d:<[inventory]>
    # Rename Waystone Button
    - if <[entity].flag[type]> != town && <player.has_permission[adriftus.waystone.<[entity].flag[type]>.rename]>:
      - inventory set slot:49 o:waystone_rename_item[flag=type:<[entity].flag[type]>;flag=entity:<[entity]>] d:<[inventory]>

    - inventory open d:<[inventory]>

waystone_rename:
  type: task
  debug: false
  script:
    - flag player waystone_rename:<context.item.flag[entity]>
    - run anvil_gui_text_input "def:<&a>Rename Waystone|<&7>Rename This Waystone|waystone_rename_callback"

waystone_rename_callback:
  type: task
  debug: false
  definitions: text_input
  script:
    - adjust <player.flag[waystone_rename]> custom_name:<[text_input].parse_color>
    - flag server waystones.<player.flag[waystone_rename].flag[type]>.<player.flag[waystone_rename].uuid>.name:<[text_input].parse_color>
    - flag player waystone_rename:!