gms_command:
  type: command
  name: gms
  description: Used to change gamemode survival
  usage: /gms (Name)
  script:
    - if <Player.has_permission[adriftus.staff]>:
      - define player <server.match_player[<context.args.get[1]>].if_null[null]>
      - adjust <[player]> gamemode:survival
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name"
            - stop
    - else:
        - narrate "<bold><red>No Permmision"
gmc_command:
  type: command
  name: gmc
  description: Used to change gamemode survival
  usage: /gmc (Name)
  script:
    - if <Player.has_permission[adriftus.staff]>:
      - define player <server.match_player[<context.args.get[1]>].if_null[null]>
      - adjust <[player]> gamemode:creative
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name"
            - stop
    - else:
        - narrate "<bold><red>No Permmision"
gma_command:
  type: command
  name: gma
  description: Used to change gamemode survival
  usage: /gma (Name)
  script:
    - if <Player.has_permission[adriftus.staff]>:
      - define player <server.match_player[<context.args.get[1]>].if_null[null]>
      - adjust <[player]> gamemode:adventure
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name"
            - stop
    - else:
        - narrate "<bold><red>No Permmision"
gmsp_command:
  type: command
  name: gmsp
  description: Used to change gamemode survival
  usage: /gmsp (Name)
  script:
    - if <Player.has_permission[adriftus.staff]>:
      - define player <server.match_player[<context.args.get[1]>].if_null[null]>
      - adjust <[player]> gamemode:spectator
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name"
            - stop
    - else:
        - narrate "<bold><red>No Permmision"