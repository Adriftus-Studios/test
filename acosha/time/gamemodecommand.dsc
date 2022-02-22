gms_command:
  type: command
  name: gms
  description: Used to change gamemode adventure
  usage: /gms (Name)
  script:
    - if <context.args.size> < 1 && <Player.has_permission[adriftus.staff]>:
      - narrate "<green><player.name>'s Game Mode Changed To Survival"
      - adjust <player> gamemode:survival
    - define player <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <Player.has_permission[adriftus.staff]>:
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
      - else:
         - narrate "<green><[player].name>'s Game Mode Changed To Survival"
         - adjust <[player]> gamemode:survival
    - else:
        - narrate "<bold><red>No Permmision"
gmc_command:
  type: command
  name: gmc
  description: Used to change gamemode creative
  usage: /gmc (Name)
  script:
    - if <context.args.size> < 1 && <Player.has_permission[adriftus.staff]>:
       - narrate "<green><player.name>'s Game Mode Changed To Creative"
       - adjust <player> gamemode:creative
    - define player <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <Player.has_permission[adriftus.staff]>:
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
      - else:
        - narrate "<green><[player].name>'s Game Mode Changed To Creative"
        - adjust <[player]> gamemode:creative
    - else:
        - narrate "<bold><red>No Permmision"
gma_command:
  type: command
  name: gma
  description: Used to Change Gamemode Adventure
  usage: /gma (Name)
  script:
    - if <context.args.size> < 1 && <Player.has_permission[adriftus.staff]>:
      - narrate "<green><player.name>'s Game Mode Changed To Adventure"
      - adjust <player> gamemode:adventure
    - define player <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <Player.has_permission[adriftus.staff]>:
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
      - else:
         - narrate "<green><[player].name>'s Game Mode Changed To Adventure"
         - adjust <[player]> gamemode:adventure
    - else:
        - narrate "<bold><red>No Permmision"
gmsp_command:
  type: command
  name: gmsp
  description: Used to change gamemode spectator
  usage: /gmsp (Name)
  script:
    - if <context.args.size> < 1 && <Player.has_permission[adriftus.staff]>:
      - narrate "<green><player.name>'s Game Mode Changed To Spectator"
      - adjust <player> gamemode:Spectator
    - define player <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <Player.has_permission[adriftus.staff]>:
       - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
       - else:
            - narrate "<green><[player].name>'s Game Mode Changed To Spectator"
            - adjust <[player]> gamemode:spectator
    - else:
        - narrate "<bold><red>No Permmision"