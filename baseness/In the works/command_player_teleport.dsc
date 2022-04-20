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
    tab complete:
        - if <context.args.get[1]> == coordinates:
            - determine cancelled
    script:
        - if <context.args.size> == 0:
            - narrate "<red><bold>Please enter a player's name."
        - if <context.args.size> == 1:
            - define player <server.match_player[<context.args.get[1]>]>
            - teleport <player> location:<[player].location>
            - narrate "Teleported <player.name> to <[player].name>" targets:<player>|<[player]>
        - if <context.args.get[1]> == <element[coordinates]>:
            - teleport <player> location:<location[<context.args.get[2]>,<context.args.get[3]>,<context.args.get[4]>,<player.world.name>]>
        - if <context.args.get[1]> == <player.name> && <context.args.get[2]> == <player.name>:
            - narrate "Bro did you just try to teleport to yourself"
        - if <context.args.size> == 2:
            - define player1 <server.match_player[<context.args.get[1]>]>
            - define player2 <server.match_player[<context.args.get[2]>]>
            - teleport <[player1]> location:<[player2].location>
            - narrate "Teleported <[player1].name> to <[player2].name>"
        - if <context.args.size> > 2:
            - narrate "<red><bold>Too many arguments!<reset>"
#