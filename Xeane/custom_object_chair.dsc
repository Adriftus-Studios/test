custom_object_oak_chair:
  type: data
  item: oak_chair
  entity: oak_chair_entity
  interaction: chair_interact
  barrier_locations:
    - <[location]>
    - <[location].above>

oak_chair:
  type: item
  material: stick
  display name: <&6>Chair
  mechanisms:
    custom_model_data: 9001
  flags:
    right_click_script: custom_object_place
    custom_object: oak_chair

oak_chair_entity:
  type: entity
  debug: false
  entity_type: armor_stand
  mechanisms:
    custom_name_visible: false
    visible: false
    gravity: false
    is_small: true
    equipment:
      helmet: oak_chair
  flags:
    on_entity_added: custom_object_update

chair_place:
  type: task
  debug: false
  script:
    - ratelimit <player> 2t
    - if <list[<context.location.above>|<context.location.above[2]>].filter[material.name.advanced_matches[air|cave_air]].size> != 2:
      - narrate "<&c>Not enough room."
      - stop
    - if !<context.location.material.is_solid> || <context.location.material.name> == barrier:
      - narrate "<&c>Must be placed on solid ground."
      - stop
    - define yaw <player.location.yaw.round_to_precision[90]>
    - spawn oak_chair_entity <context.location.center.above[0.7].with_yaw[<[yaw]>]> save:entity
    - modifyblock <context.location.above>|<context.location.above[2]> barrier
    - flag <entry[entity].spawned_entity> barriers:|:<context.location.above>|<context.location.above[2]>
    - run custom_object_handler def:<entry[entity].spawned_entity>
    - take iteminhand quantity:1

chair_stop_sit:
  type: task
  debug: false
  script:
    - ratelimit <player> 2t
    - animate <player> animation:stop_sitting
    - flag player on_dismount:<-:chair_stop_sit
    - showfake <player.flag[chair].flag[barriers]> cancel
    - flag player chair:!
    - wait 5t
    - flag player no_suffocate:!

chair_interact:
  type: task
  debug: false
  script:
    - ratelimit <player> 2t
    - determine passively cancelled
    - define entity <context.location.flag[custom_object]>
    - if <player.is_sneaking>:
      - run custom_object_remove def:<[entity]>
      - stop
    - teleport <player> <[entity].location.above[0.22]>
    - animate <player> animation:sit
    - showfake <[entity].flag[barriers]> air duration:999h
    - flag player no_suffocate
    - flag player chair:<[entity]>
    - flag player on_dismount:->:chair_stop_sit
