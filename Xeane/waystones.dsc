waystone_town:
  type: item
  material: feather
  mechanisms:
    custom_model_data: 20
  flags:
    right_click_script: waystone_place
    type: town

waystone_wild:
  type: item
  material: feather
  mechanisms:
    custom_model_data: 20
  flags:
    right_click_script: waystone_place
    type: wild

waystone_server:
  type: item
  material: feather
  mechanisms:
    custom_model_data: 20
  flags:
    right_click_script: waystone_place
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
    right_click_script: waystone_use
    on_entity_added: custom_object_handler

waystone_place:
  type: task
  debug: false
  script:
    - if <list[town|server|wild].contains[<context.item.flag[type]>]>:
      - inject waystone_place_<context.item.flag[type]>
      - flag <entry[waystone].spawned_entity> type:<context.item.flag[type]>
      - modifyblock <[barrier_blocks]> barrier
      - showfake <[barrier_blocks]> air duration:9999m players:<context.location.find_players_within[50]>
      - take iteminhand
      - run custom_object_handler def:<entry[waystone].spawned_entity>

waystone_place_wild:
  type: task
  debug: false
  script:
    - ratelimit <player> 1t
    - if !<player.has_permission[adriftus.waystone.wild]>:
      - narrate "<&c>You lack the permission to place a wild waystone."
      - stop
    - spawn "waystone_entity[custom_name=<&a>Wild Waystone]" <context.location.above.center.below[0.49]> save:waystone
    - if !<entry[waystone].spawned_entity.is_spawned>:
      - narrate "<&c>ERROR - Report Me - Error Code<&co> WaystoneNotSpawning"
      - stop
    - flag server waystones.server.<entry[waystone].spawned_entity.uuid>.location:<player.location.with_pose[0,<player.location.yaw.sub[180]>]>
    - flag server waystones.server.<entry[waystone].spawned_entity.uuid>.name:<entry[waystone].spawned_entity.uuid>
    - define barrier_blocks <list[<entry[waystone].spawned_entity.location>|<entry[waystone].spawned_entity.location.above>]>


waystone_place_server:
  type: task
  debug: false
  script:
    - ratelimit <player> 1t
    - if !<player.has_permission[adriftus.waystone.server]>:
      - narrate "<&c>You lack the permission to place a server waystone."
      - stop
    - spawn "waystone_entity[custom_name=<&6>Server Waystone]" <context.location.above.center.below[0.49]> save:waystone
    - if !<entry[waystone].spawned_entity.is_spawned>:
      - narrate "<&c>ERROR - Report Me - Error Code<&co> WaystoneNotSpawning"
      - stop
    - flag server waystones.server.<entry[waystone].spawned_entity.uuid>.location:<player.location.with_pose[0,<player.location.yaw.sub[180]>]>
    - flag server waystones.server.<entry[waystone].spawned_entity.uuid>.name:<entry[waystone].spawned_entity.uuid>
    - define barrier_blocks <list[<entry[waystone].spawned_entity.location>|<entry[waystone].spawned_entity.location.above>]>

waystone_place_town:
  type: task
  debug: false
  script:
    - ratelimit <player> 1t
    - if !<context.location.town.exists>:
      - narrate "<&c>Waystones must be placed in a town."
      - stop
    - if <player> != <context.location.town.mayor>:
      - narrate "<&c>Waystones must be placed by the Mayor."
      - stop
    - if <context.location.town.has_flag[waystone]>:
      - narrate "<&c>You can only have one waystone in your Town"
      - stop
    - define town <context.location.town>
    - spawn "waystone_entity[custom_name=<&6><context.location.town.name> Waystone]" <context.location.above.center.below[0.49]> save:waystone
    - if !<entry[waystone].spawned_entity.is_spawned>:
      - narrate "<&c>ERROR - Report Me - Error Code<&co> WaystoneNotSpawning"
      - stop
    - define barrier_blocks <list[<entry[waystone].spawned_entity.location>|<entry[waystone].spawned_entity.location.above>]>
    - flag <[town]> waystone.entity:<entry[waystone].spawned_entity>
    - flag <[town]> waystone.location:<entry[waystone].spawned_entity.location.simple>
    - flag <[town]> waystone.blocks:|:<[barrier_blocks]>
    - flag <[town]> waystone.tp_location:<player.location.with_pose[0,<player.location.yaw.sub[180]>]>
    - flag <entry[waystone].spawned_entity> town:<context.location.town>

waystone_use:
  type: task
  debug: false
  script:
    - determine passively cancelled
    - choose <context.entity.flag[type]>:
      - case town:
        - if <player.has_flag[waystones.town.<context.entity.flag[town]>]>:
          - inject waystone_open_teleport_main_menu
        - else:
          - run totem_test def:2
          - title "title:<&a>Waystone Unlocked!" fade_in:1s stay:1s fade_out:1s
          - flag <player> waystones.town.<context.entity.flag[town]>.location:<context.entity.location.simple>
          - flag <player> waystones.town.<context.entity.flag[town]>.entity_uuid:<context.entity.uuid>
          - flag <context.entity> unlocked_players:->:<player>
      - case server:
        - inject waystone_open_teleport_main_menu
      - case wild:
        - if <player.has_flag[waystones.wild.<context.entity.uuid>]>:
          - inject waystone_open_teleport_main_menu
        - else:
          - run totem_test def:2
          - title "title:<&a>Waystone Unlocked!" fade_in:1s stay:1s fade_out:1s
          - flag <player> waystones.wild.<context.entity.uuid>.location:<context.entity.location.simple>
          - flag <context.entity> unlocked_players:->:<player>

waystone_remove:
  type: task
  debug: false
  script:
    - define town <context.item.flag[town]>
    - remove <[town].flag[waystone.entity]>
    - modifyblock <[town].flag[waystone.blocks]> air
    - showfake cancel <[town].flag[waystone.blocks]>
    - foreach <[town].flag[waystone.entity].flag[unlocked_players]>:
      - flag <[value]> waystones.<[town]>:!
    - flag <[town]> waystone:!
    - inventory close
    - give waystone_<context.item.flag[type]> to:<player.inventory>

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

waystone_open_teleport_server_menu:
  type: task
  debug: false
  script:
    - define inventory <inventory[waystone_teleport_menu]>
    - foreach <server.flag[waystones.server]> as:data_map:
      - give waystone_gui_item[flag=location:<[data_map].get[location]>;display=<[data_map].get[name]>] to:<[inventory]>

waystone_open_teleport_wild_menu:
  type: task
  debug: false
  script:
    - define inventory <inventory[waystone_teleport_menu]>
    - foreach <server.flag[waystones.wild]> as:data_map:
      - give waystone_gui_item[flag=location:<[data_map].get[location]>;display=<[data_map].get[name]>] to:<[inventory]>

waystone_open_teleport_main_menu:
  type: task
  debug: false
  script:
    - define inventory <inventory[waystone_teleport_menu]>
    - give waystone_submenu_item[display=Towns;flag=type:town] to:<[inventory]>
    - give waystone_submenu_item[display=Server;flag=type:server] to:<[inventory]>
    - give waystone_submenu_item[display=Wild;flag=type:wild] to:<[inventory]>
    - if <context.entity.flag[type]> == town && <player> == <context.entity.flag[town].mayor>:
      - inventory set slot:50 o:waystone_remove_item[flag=type:<context.entity.flag[type]>;flag=town:<context.entity.flag[town]>] d:<[inventory]>

    - inventory open d:<[inventory]>