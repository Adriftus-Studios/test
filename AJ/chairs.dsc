chair_sit_events:
  type: world
  debug: true
  data:
    modifiers:
      INNER_RIGHT: 45
      INNER_LEFT: -45
      OUTER_RIGHT: 45
      OUTER_LEFT: -45
      STRAIGHT: 0
    sides:
      NORTH: 360
      SOUTH: 180
      EAST: 90
      WEST: 270
  events:
    on player breaks block:
    - stop if:<context.location.has_flag[sit.point].not.if_null[true]>
    - define point <context.location.flag[sit.point]>
    - adjust <[point]> passengers:<list[]>
    - define before <[point].location.sub[<[point].flag[sit.offset]>].with_yaw[<player.location.yaw>].with_pitch[<player.location.pitch>]>
    - teleport <player> <[before]>
    - remove <[point]>
    on player right clicks block:
    - stop if:<context.location.material.name.ends_with[stairs].not.if_null[true]>
    - stop if:<context.location.material.half.equals[BOTTOM].not>
    - stop if:<player.is_sneaking>
    # - ratelimit <player> 10t if:<player.is_inside_vehicle>
    - determine passively cancelled
    - if <player.is_inside_vehicle>:
      - adjust <player.vehicle> passengers:<list[]>
      - wait 1t
    - spawn armor_stand <context.location.center.below[1.7]> save:mount_point
    - define point <entry[mount_point].spawned_entity>
    - define yaw <script.data_key[data.sides.<context.location.material.direction>].add[<script.data_key[data.modifiers.<context.location.material.shape>]>]>
    - rotate <[point]> yaw:<[yaw]> duration:1t frequency:1t
    - adjust <[point]> gravity:false
    - invisible <[point]>
    - flag <[point]> sit.offset:<[point].location.sub[<player.location>]>
    - flag <[point]> sit.location:<context.location>
    - flag <context.location> sit.point:<[point]> expire:24h
    - adjust <[point]> passenger:<player>
    after player exits vehicle:
    - stop if:<context.vehicle.has_flag[sit.offset].not>
    # - teleport <player> <context.vehicle.location.sub[<context.vehicle.flag[sit.offset]>].with_yaw[<player.location.yaw>].with_pitch[<player.location.pitch>]>
    - adjust <context.vehicle> passengers:<list[]>
    - flag <context.vehicle.flag[sit.location]> sit:!
    - remove <context.vehicle>
    on player kicked for flying:
    - determine cancelled if:<player.vehicle.has_flag[sit.offset].if_null[false]>