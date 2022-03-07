Generic_Freeze_Task:
  type: task
  debug: true
  definitions: player|mode|location
  ## Usage: "- run Generic_Freeze_Task instantly def:<PlayerTag>|(freeze/unfreeze)(|<LocationTag>)"
  ## Location is required for freeze mode only-- omit for unfreeze mode.
  script:
    - choose <[mode]>:
      - case unfreeze:
        - flag <[player]> frozen:!
        - adjust <[player]> fly_speed:<[player].flag[freeze_task_flight_speed]>
        - adjust <[player]> flying:false
        - adjust <[player]> fov_multiplier:0.0
        - adjust <[player]> can_fly:<[player].flag[freeze_task_flight_permissions]>
        - flag <[player]> freeze_task_flight_permissions:!
        - flag <[player]> freeze_task_flight_speed:!
      - case freeze:
        - teleport <[player]> <[location]>
        - flag <[player]> frozen:<[location]>
        - flag <[player]> freeze_task_flight_permissions:<[player].can_fly>
        - flag <[player]> freeze_task_flight_speed:<[player].fly_speed>
        - adjust <[player]> can_fly:true
        - adjust <[player]> fly_speed:0.0
        - teleport <[player]> <[player].location.add[0,0.001,0]>
        - adjust <[player]> flying:true
        - adjust <[player]> fov_multiplier:0.0

Generic_Freeze_Lock:
  type: world
  debug: true
  events:
    on player stops flying flagged:frozen:
      - determine passively cancelled
      - wait 1t
      - adjust <player> fov_multiplier:0.0
      - teleport <player> <player.flag[frozen]>