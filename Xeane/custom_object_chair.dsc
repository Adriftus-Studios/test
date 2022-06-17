custom_object_oak_chair:
  type: data
  item: oak_chair
  entity: oak_chair_entity
  interaction: chair_interact
  place_checks_task: chair_place_check
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
    unique: <server.current_time_millis>

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

chair_place_check:
  type: task
  debug: false
  script:
    - if <[location].has_town> && !<player.can_build[<[location]>]>:
      - narrate "<&c>You dont no have build permissions here"
      - stop

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
    - determine passively cancelled
    - ratelimit <player> 2t
    - define entity <context.location.flag[custom_object]>
    - if <player.is_sneaking>:
      - if <[entity].location.has_town> && !<player.can_build[<[entity].location>]>:
        - narrate "<&c>You dont no have build permissions here"
        - stop
      - run custom_object_remove def:<[entity]>
      - stop
    - teleport <player> <[entity].location.above[0.22]>
    - animate <player> animation:sit
    - showfake <[entity].flag[barriers]> air duration:999h
    - flag player no_suffocate
    - flag player chair:<[entity]>
    - flag player on_dismount:->:chair_stop_sit
