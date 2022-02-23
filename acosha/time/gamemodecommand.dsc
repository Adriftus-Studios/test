gms_command:
  type: command
  name: gms
  description: Used to change gamemode adventure
  usage: /gms (Name)
  script:
    - if <context.args.size> < 1 && <Player.has_permission[adriftus.staff.gms]>:
      - narrate "<green><player.name>'s Game Mode Changed To Survival"
      - adjust <player> gamemode:survival
      - stop
    - if !<Player.has_permission[adriftus.staff.gms]>:
      - narrate "<bold><red>No Permmision"
      - stop
    - define player <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <Player.has_permission[adriftus.staff.gms]>:
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
      - else:
         - narrate "<green><[player].name>'s Game Mode Changed To Survival"
         - adjust <[player]> gamemode:survival

gmc_command:
  type: command
  name: gmc
  description: Used to change gamemode creative
  usage: /gmc (Name)
  script:
    - if <context.args.size> < 1 && <Player.has_permission[adriftus.staff]>:
       - narrate "<green><player.name>'s Game Mode Changed To Creative"
       - adjust <player> gamemode:creative
       - stop
    - if !<Player.has_permission[adriftus.staff.gmc]>:
        - narrate "<bold><red>No Permmision"
        - stop
    - define player <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <Player.has_permission[adriftus.staff.gmc]>:
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
      - else:
        - narrate "<green><[player].name>'s Game Mode Changed To Creative"
        - adjust <[player]> gamemode:creative

gma_command:
  type: command
  name: gma
  description: Used to Change Gamemode Adventure
  usage: /gma (Name)
  script:
    - if <context.args.size> < 1 && <Player.has_permission[adriftus.staff.gma]>:
      - narrate "<green><player.name>'s Game Mode Changed To Adventure"
      - adjust <player> gamemode:adventure
      - stop
    - if !<Player.has_permission[adriftus.staff.gma]>:
      - narrate "<bold><red>No Permmision"
      - stop
    - define player <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <Player.has_permission[adriftus.staff.gma]>:
      - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
      - else:
         - narrate "<green><[player].name>'s Game Mode Changed To Adventure"
         - adjust <[player]> gamemode:adventure

gmsp_command:
  type: command
  name: gmsp
  description: Used to change gamemode spectator
  usage: /gmsp (Name)
  script:
    - if <context.args.size> < 1 && <Player.has_permission[adriftus.staff.gmsp]>:
      - narrate "<green><player.name>'s Game Mode Changed To Spectator"
      - adjust <player> gamemode:Spectator
      - stop
    - if !<Player.has_permission[adriftus.staff.gmsp]>:
      - narrate "<bold><red>No Permmision"
      - stop
    - define player <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <Player.has_permission[adriftus.staff.gmsp]>:
       - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
       - else:
            - narrate "<green><[player].name>'s Game Mode Changed To Spectator"
            - adjust <[player]> gamemode:spectator
