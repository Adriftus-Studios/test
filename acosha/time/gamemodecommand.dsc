gms_command:
  type: command
  name: gms
  description: Used to change gamemode survival
  usage: /gms
  script:
    - if <Player.has_permission[adriftus.staff]>:
      - adjust <player> gamemode:survival
    - else:
        - narrate "<bold><red> No Permmision"
gmc_command:
  type: command
  name: gmc
  description: Used to change gamemode survival
  usage: /gmc
  script:
    - if <Player.has_permission[adriftus.staff]>:
      - adjust <player> gamemode:creative
    - else:
        - narrate "<bold><red> No Permmision"
gma_command:
  type: command
  name: gma
  description: Used to change gamemode survival
  usage: /gma
  script:
    - if <Player.has_permission[adriftus.staff]>:
      - adjust <player> gamemode:adventure
    - else:
        - narrate "<bold><red> No Permmision"
gmsp_command:
  type: command
  name: gmsp
  description: Used to change gamemode survival
  usage: /gmsp
  script:
    - if <Player.has_permission[adriftus.staff]>:
      - adjust <player> gamemode:spectator
    - else:
        - narrate "<bold><red> No Permmision"