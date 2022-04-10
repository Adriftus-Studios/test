kill_based_every_time:
  type: world
  debug: false
  events:
    on player dies bukkit_priority:HIGHEST:
      - determine cancelled:false