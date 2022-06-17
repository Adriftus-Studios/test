custom_object_handler:
  type: task
  debug: false
  definitions: object
  script:
    - define object <context.entity> if:<[object].exists.not>
    - if <[object].has_flag[barriers]>:
      - flag <[object].has_flag[barriers]> on_right_click:<context.entity.flag[right_click_script]>

custom_bject_handler_cleanup:
  type: world
  debug: false
  events:
    on server start:
      - flag server custom_objects.active:!