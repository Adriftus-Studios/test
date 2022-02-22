gms_command:
  type: command
  name: gms
  description: Used to change gamemode adventure
  usage: /gms (Name)
  script:
    - if <Player.has_permission[adriftus.staff]>:
      - define player <server.match_player[<context.args.get[1]>].if_null[null]>
      - adjust <[player]> gamemode:survival
      - narrate <green>Game Mode Changed To Survival
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name"
            - stop
    - else:
        - narrate "<bold><red>No Permmision"
gmc_command:
  type: command
  name: gmc
  description: Used to change gamemode creative
  usage: /gmc (Name)
  script:
    - if <Player.has_permission[adriftus.staff]>:
      - define player <server.match_player[<context.args.get[1]>].if_null[null]>
      - adjust <[player]> gamemode:creative
      - narrate <green>Game Mode Changed To Creative
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name"
            - stop
    - else:
        - narrate "<bold><red>No Permmision"
gma_command:
  type: command
  name: gma
  description: Used to Change Gamemode Adventure
  usage: /gma (Name)
  script:
    - if <Player.has_permission[adriftus.staff]>:
      - define player <server.match_player[<context.args.get[1]>].if_null[null]>
      - adjust <[player]> gamemode:adventure
      - narrate <green>Game Mode Changed To Survival
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name"
            - stop
    - else:
        - narrate "<bold><red>No Permmision"
gmsp_command:
  type: command
  name: gmsp
  description: Used to change gamemode spectator
  usage: /gmsp (Name)
  script:
    - if <Player.has_permission[adriftus.staff]>:
      - define player <server.match_player[<context.args.get[1]>].if_null[null]>
      - adjust <[player]> gamemode:spectator
      - narrate "<green>Game Mode Changed To Spectator"
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name"
            - stop
    - else:
        - narrate "<bold><red>No Permmision"