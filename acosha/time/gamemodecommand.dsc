gms_command:
  type: command
  name: gms
  description: Used to change gamemode survival
  usage: /gms
  script:
    - if <Player.has_permission[adriftus.staff]>:
      - adjust <player> gamemode:survival