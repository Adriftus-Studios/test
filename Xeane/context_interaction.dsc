context_menu_events:
  type: world
  debug: false
  events:
    on player right clicks player with:air:
      - if <player.is_sneaking>:
        - inject open_context_menu

open_context_menu:
  type: task
  debug: false
  script:
    - define target <context.entity>
    - define options trade
    - define points <player.eye_location.forward[1].up[0.5]>
    - foreach <[options].get[1].to[<[points].size>]>:
      - fakespawn context_menu_<[value]>[flag=target:<[target]>] duration:10s save:option

context_menu_trade:
  type: entity
  debug: false
  entity_type: armor_stand
  mechanisms:
    equipment:
      head: feather[custom_model_data=1]
    visible: false
    custom_name: <&a>Trade
    custom_name_visible: true
    is_small: true
  flags:
    right_click_script: context_trade_initiate

context_trade_initiate:
  type: task
  debug: false
  script:
    - determine passively cancelled
    - run trade_open def:<context.entity.flag[target]>