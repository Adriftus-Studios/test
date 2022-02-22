gms_command:
  type: command
  name: gms
  description: Used to change gamemode adventure
  usage: /gms (Name)
  script:
    - define player <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <Player.has_permission[adriftus.staff]>:
      - adjust <[player]> gamemode:survival
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name"
            - stop
      - else:
         - narrate "<green><[player].name>Game Mode Changed To Survival"
    - else:
        - narrate "<bold><red>No Permmision"
gmc_command:
  type: command
  name: gmc
  description: Used to change gamemode creative
  usage: /gmc (Name)
  script:
    - define player <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <Player.has_permission[adriftus.staff]>:
      - adjust <[player]> gamemode:creative
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name"
            - stop
      - else:
        - narrate "<green><[player].name>Game Mode Changed To Creative"
    - else:
        - narrate "<bold><red>No Permmision"
gma_command:
  type: command
  name: gma
  description: Used to Change Gamemode Adventure
  usage: /gma (Name)
  script:
    - define player <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <Player.has_permission[adriftus.staff]>:
      - adjust <[player]> gamemode:adventure
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name"
            - stop
      - else:
         - narrate "<green><[player].name>Game Mode Changed To Adventure"
    - else:
        - narrate "<bold><red>No Permmision"
gmsp_command:
  type: command
  name: gmsp
  description: Used to change gamemode spectator
  usage: /gmsp (Name)
  script:
    - define player <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <Player.has_permission[adriftus.staff]>:
      - adjust <[player]> gamemode:spectator
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name"
            - stop
      - else:
        - narrate "<green><[player].name>Game Mode Changed To Spectator"
    - else:
        - narrate "<bold><red>No Permmision"