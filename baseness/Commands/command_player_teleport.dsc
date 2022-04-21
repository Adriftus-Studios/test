player_teleport:
    type: command
    debug: false
    name: Teleport
    description: Teleport.
    usage: /teleport
    aliases:
        - tp
    tab completions:
        1: <server.online_players.parse[name]>|coordinates
        2: <server.online_players.parse[name]>
    script:
        ## = Exclusions = ##
        ## No arguments
        - if <context.args.size> == 0:
            - narrate "<red><bold>Please enter a player's name."
        ## Too many arguments
        - if <context.args.size> > 2 && !(<context.args.get[1]> == coordinates):
            - narrate "<red><bold>Too many arguments!<reset>"

        ## = Executions = ##
        ## BUT WHY THO
        - if (<context.args.get[1]> == <player.name> && <context.args.get[2]> == <player.name>) || <context.args.get[1]> == <player.name>:
            - narrate "<bold><red>Did you just teleport to yourself."
            - stop
        ## If only one argument, teleport player to target player
        - if <context.args.size> == 1:
            - define player <server.match_player[<context.args.get[1]>]>
            - teleport <player> location:<[player].location>
            - narrate "Teleported <player.name> to <[player].name>" targets:<player>|<[player]>
        ## Argument 1 = coordinates
        - if <context.args.get[1]> == coordinates && <context.args.size> == 4:
            - teleport <player> location:<location[<context.args.get[2]>,<context.args.get[3]>,<context.args.get[4]>,<player.world.name>]>
            - narrate "Teleported <player.name> to - "
            - narrate <context.args.get[2]>
            - narrate <context.args.get[3]>
            - narrate <context.args.get[4]>
        ## 2 arguments = teleport Player 1 to Player 2
        - if <context.args.size> == 2:
            - define player1 <server.match_player[<context.args.get[1]>]>
            - define player2 <server.match_player[<context.args.get[2]>]>
            - teleport <[player1]> location:<[player2].location>
            - narrate "Teleported <[player1].name> to <[player2].name>"
## Player names need to be removed from second tab completion