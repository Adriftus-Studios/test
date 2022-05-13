aj_test_events:
  type: world
  debug: false
  events:
    on leaves decay:
    - if <context.location.world.has_flag[no_leave_decay]>:
      - determine cancelled