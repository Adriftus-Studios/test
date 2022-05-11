waystone:
  type: item
  material: feather
  mechanisms:
    custom_model_data: 20
  flags:
    right_click_script: waystone_place

waystone_place:
  type: task
  debug: false
  script:
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
    - spawn "waystone_entity[custom_name=<context.location.town.name> <&f>Waystone]" <context.location.above.center.below[0.49]> save:waystone
    - flag <[town]> waystone.entity:<entry[waystone].spawned_entity>
    - flag <[town]> waystone.location:<entry[waystone].spawned_entity.location.simple>
    - flag <[town]> waystone.tp_location:<player.location.with_pose[0,<player.location.sub[180]>]>
    - flag <entry[waystone].spawned_entity> town:<context.location.town>
    - flag <entry[waystone].spawned_entity> right_click_script:waystone_use
    - flag <entry[waystone].spawned_entity> on_entity_added:waystone_rename

waystone_use:
  type: task
  debug: false
  script:
    - if <player.has_flag[waystones.<context.entity.flag[town]>]>:
      - inject waystone_open_teleport_menu
    - else:
      - flag <player> waystones.<context.entity.town>.location:<context.entity.location.simple>
      - flag <player> waystones.<context.entity.town>.entity_uuid:<context.entity.uuid>
      - flag <context.entity> unlocked_players:->:<player>

waystone_rename:
  type: task
  debug: false
  script:
    - stop
    ## PLACEHOLDER FOR FUTURE CODE

waystone_remove:
  type: task
  debug: false
  script:
    - define town <context.item.flag[town]>
    - remove <[town].flag[waystone.entity]>
    - foreach <[town].flag[waystone.entity].flag[unlocked_players]>:
      - flag <[value]> waystones.<[town]>:!
    - flag <[town]> waystone:!
    - inventory close

waystone_gui_item:
  type: item
  material: feather
  display name: <&c>PLACEHOLDER
  mechanisms:
    custom_model_data: 20

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
    - foreach <player.flag[waystones]> key:key as:value:
      - if <[value].mod[45]> == 0:
        - foreach stop
      - if !<town[<[key]>].exists>:
        - flag <player> waystones.<[key]>:!
        - foreach next
      - if <player.flag[waystone.<[key]>.location]> != <town[<[key]>].flag[waystone]>:
        - flag <player> waystones.<[key]>:!
        - foreach next
      - give waystone_gui_item[flag=town:<[key]>;display=<town[<[key]>].name>] to:<[inventory]>

    ## For Mayor only
    ## Revert Waystone to item form
    - if <player> == <context.entity.flag[town].mayor>:
      - inventory set slot:46 o:waystone_remove_item[flag=town:<context.entity.flag[town]>] d:<[inventory]>

    - inventory open d:<[inventory]>