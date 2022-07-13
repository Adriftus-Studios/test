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
    - determine passively cancelled
    - repeat 4 as:distance:
      - repeat 12:
        - spawn primed_tnt <context.location.rotate_yaw[<context.location.yaw.add[<[value].mul[30]>]>].forward_flat[<[distance].add[3]>]>
        - wait 1t