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
    - ratelimit <context.location> 10s
    - determine passively cancelled
    - if <context.location.material.name> == chest:
      - animatechest <context.location> open <context.location.find_players_within[120]>
      - wait 10t
    - repeat 3 as:distance:
      - repeat 12:
        - shoot primed_tnt height:5 o:<context.location.center.above[0.25]> destination:<context.location.rotate_yaw[<context.location.yaw.add[<[value].mul[30]>]>].forward_flat[<[distance].mul[4]>]>
        - wait 1t