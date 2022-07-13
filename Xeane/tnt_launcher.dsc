location_launch_tnt:
  type: task
  debug: false
  script:
    - determine passively cancelled
    - shoot primed_tnt origin:<context.location.with_facing_direction.forward[1]> speed:3

location_tnt_trap:
  type: task
  debug: false
  script:
    - repeat 12:
      - spawn primed_tnt <context.location.rotate_yaw[<context.location.yaw.add[<[value].mul[30]>]>].forward_flat[3]>