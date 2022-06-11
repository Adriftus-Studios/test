custom_object_handler:
  type: task
  debug: false
  definitions: object
  script:
    - define object <context.entity> if:<[object].exists.not>
    - flag server custom_objects.active:->:<[object]>
    - if <server.flag[custom_objects.active].size> == 1:
      - while <server.has_flag[custom_objects.active]>:
        # Double nested cause this fucker just keeps dying for some reason?
        - while <server.has_flag[custom_objects.active]>:
          - foreach <server.flag[custom_objects.active]> as:object:
            - if !<[object].is_spawned>:
              - flag server custom_objects.active:<-:<[object]>
              - foreach next
            - define targets <[object].location.find_players_within[30].filter_tag[<[filter_value].fake_block[<[object].location>].exists.not>]>
            - if <[targets].size> == 0:
              - wait 1t
              - foreach next
            - showfake <[object].location>|<[object].location.above> air players:<[targets]>
            - wait 1t
          - wait 1t
        - wait 1t

custom_bject_handler_cleanup:
  type: world
  debug: false
  events:
    on server start:
      - flag server custom_objects.active:!