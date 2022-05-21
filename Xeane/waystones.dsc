waystone:
  type: item
  material: feather
  mechanisms:
    custom_model_data: 20
  flags:
    right_click_script: waystone_place

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
    on_entity_added: waystone_active_start

waystone_place:
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
    - modifyblock <[barrier_blocks]> barrier
    - flag <[town]> waystone.entity:<entry[waystone].spawned_entity>
    - flag <[town]> waystone.location:<entry[waystone].spawned_entity.location.simple>
    - flag <[town]> waystone.blocks:|:<[barrier_blocks]>
    - flag <[town]> waystone.tp_location:<player.location.with_pose[0,<player.location.yaw.sub[180]>]>
    - flag <entry[waystone].spawned_entity> town:<context.location.town>
    - showfake <[barrier_blocks]> air duration:9999m players:<context.location.find_players_within[30]>
    - take iteminhand
    - run waystone_active def:<entry[waystone].spawned_entity>

waystone_active_start:
  type: task
  debug: false
  script:
    - wait 1t
    - define entity <context.entity>
    - run waystone_active def:<[entity]>

waystone_use:
  type: task
  debug: false
  script:
    - determine passively cancelled
    - if <player.has_flag[waystones.<context.entity.flag[town]>]>:
      - inject waystone_open_teleport_menu
    - else:
      - run totem_test def:2
      - title "title:<&a>Waystone Unlocked!" fade_in:1s stay:1s fade_out:1s
      - flag <player> waystones.<context.entity.flag[town]>.location:<context.entity.location.simple>
      - flag <player> waystones.<context.entity.flag[town]>.entity_uuid:<context.entity.uuid>
      - flag <context.entity> unlocked_players:->:<player>

waystone_active:
  type: task
  debug: false
  definitions: entity
  script:
    - while <[entity].is_spawned>:
      - foreach <[entity].location.find_players_within[30]>:
        - if <[value].fake_block[<[entity].location>].exists>:
          - foreach next
        - showfake <[entity].location> air duration:9999m players:<[value]>
        - showfake <[entity].location.above> air duration:9999m players:<[value]>
      - wait 5s

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
    - give waystone to:<player.inventory>

waystone_gui_item:
  type: item
  material: feather
  display name: <&c>PLACEHOLDER
  mechanisms:
    custom_model_data: 20
  flags:
    run_script: waystone_teleport

waystone_teleport:
  type: task
  debug: false
  script:
    - define town <context.item.flag[town]>
    - run teleportation_animation_run def:<[town].flag[waystone.tp_location]>

waystone_teleport_menu:
  type: inventory
  inventory: chest
  size: 54
  title: <&a>Available Waystones
  gui: true

waystone_remove_item:
  type: item
  material: barrier
  display name: <&c>Remove Waystone
  flags:
    run_script: waystone_remove

waystone_open_teleport_menu:
  type: task
  debug: false
  script:
    - define inventory <inventory[waystone_teleport_menu]>
    - foreach <player.flag[waystones]> key:town as:value:
      - if <[loop_index].mod[45]> == 0:
        - foreach stop
      - if !<town[<[town]>].exists>:
        - flag <player> waystones.<[town]>:!
        - foreach next
      - if <player.flag[waystones.<[town]>.location]> != <town[<[town]>].flag[waystone.location]>:
        - flag <player> waystones.<[town]>:!
        - foreach next
      - give waystone_gui_item[flag=town:<town[<[town]>]>;display=<town[<[town]>].name>] to:<[inventory]>

    # For Mayor only
    # Revert Waystone to item form
    - if <player> == <context.entity.flag[town].mayor>:
      - inventory set slot:50 o:waystone_remove_item[flag=town:<context.entity.flag[town]>] d:<[inventory]>

    - inventory open d:<[inventory]>