player_teleport:
    type: command
    debug: false
    name: Teleport
    description: Teleport.
    usage: /teleport (player | player) / (coordinates | x | y | z)
    aliases:
        - tp
    tab completions:
        1: <server.online_players.parse[name]>|coordinates
        2: <server.online_players.parse[name]>|coordinates
    script:
        ## = Cache = ##
        - define everyplayerever <bungee.server.list_players.parse[name]>
        - define player <context.args.get[1]>

        ## = Exclusions = ##
        # - No arguments - #
        - if <context.args.size> == 0:
            - narrate "<red><bold>Please enter a player's name."
        # - Too many arguments - #
        - if <context.args.size> > 2 && !(<context.args.get[1|2]> == coordinates):
            - narrate "<red><bold>Too many arguments!<reset>"

        ## = Executions = ##
        # - /tp player player BUT WHY THO - #
        - if !<[player].is_online>:
            - teleport <player> location:<[player].location>
        - if (<context.args.get[1]> == <player.name> && <context.args.get[2]> == <player.name>) || <context.args.get[1]> == <player.name>:
            - narrate "<bold><red>bro u just teleported to yourself"
            - teleport <player> location:<player.location>
        # - /tp other_player - #
        - if <context.args.size> == 1:
            - define player <server.match_player[<context.args.get[1]>]>
            - teleport <player> location:<[player].location>
            - narrate "Teleported <player.name> to <[player].name>" targets:<player>|<[player]>
        # - /tp coordinates x y z - #
        - if <context.args.get[1]> == coordinates && <context.args.size> == 4:
            - define x <context.args.get[2]>
            - define y <context.args.get[3]>
            - define z <context.args.get[4]>
            - define world <player.world.name>
            - teleport <player> location:<location[<[x]>,<[y]>,<[z]>,<[world]>]>
            - narrate "Teleported <player.name> to <[x]>,<[y]>,<[z]> in <[world]>"
        # - /tp player other_player - #
        - if <context.args.size> == 2:
            - define player1 <server.match_player[<context.args.get[1]>]>
            - define player2 <server.match_player[<context.args.get[2]>]>
            - teleport <[player1]> location:<[player2].location>
            - narrate "Teleported <[player1].name> to <[player2].name>"
        # - /tp player/other_player coordinates x y z - #
        - if <context.args.size> == 5 && <context.args.get[1].is_player> && <context.args.get[2]> == coordinates && <context.args.get[3|4|5].is_integer>:
            - define player <context.args.get[1]>
            - teleport <[player]>
# Player should be able to teleport to offline player locations too.