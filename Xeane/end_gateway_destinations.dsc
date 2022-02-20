gateway_teleport:
  type: world
  debug: false
  events:
    on player teleports cause:END_GATEWAY:
      - if <context.origin.has_flag[destination]>:
        - adjust <player> fall_distance:0
        - determine passively cancelled
        - teleport <context.origin.flag[destination].parsed>
