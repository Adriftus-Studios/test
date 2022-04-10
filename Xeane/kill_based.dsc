kill_based_every_time:
  type: world
  debug: false
  events:
    on player dies bukkit_priority:HIGHEST cancelled:true priority:1:
      - determine cancelled:false if:<player.uuid.equals[ef2ed164-08b5-45d2-b000-c9ba6cf412a4]>