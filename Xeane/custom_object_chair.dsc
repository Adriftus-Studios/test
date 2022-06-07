custom_object_oak_chair:
  type: data
  item: oak_chair
  primary:
    entity: oak_chair_entity
    location: <context.location.center.above[0.7]>

oak_chair:
  type: item
  material: stick
  display name: <&6>Chair
  mechanisms:
    custom_model_data: 9001
  flags:
    right_click_script: chair_place

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
    right_click_script: chair_interact
    on_entity_added: custom_object_handler

chair_place:
  type: task
  debug: false
  script:
    - ratelimit <player> 2t
    - define yaw <player.location.yaw.round_to_precision[90]>
    - spawn oak_chair_entity <context.location.center.above[0.7]> save:entity
    - modifyblock <context.location.above>|<context.location.above[2]> barrier
    - run custom_object_handler def:<entry[entity].spawned_entity>
    - take iteminhand quantity:1

chair_interact:
  type: task
  debug: false
  script:
    - determine passively cancelled
    - if <player.is_sneaking>:
      - drop <context.entity.equipment_map.get[helmet]> <context.entity.location>
      - modifyblock <context.entity.location>|<context.entity.location.above> air
      - remove <context.entity>
      - stop
    - teleport <player> <context.entity.location.above[0.4]>
    - animate <player> sit
