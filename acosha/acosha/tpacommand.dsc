
tpa_command:
    type: command
    name: tpa
    description: Used To Request A Teleport
    usage: /tpa (name)
    script:
       - if <context.args.size> < 1:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
       - define player <server.match_player[<context.args.get[1]>].if_null[null]>
       - if <[player]> = null:
            - narrate "<red><bold>This Is Not A Player"
            - stop
       - if <[player]> = <player.name>:
               - narrate "You Can Not Tpaccept Yourself"
               - stop
       - else:
            - narrate "<yellow>Wait For Player To Accept"
            - narrate "<yellow>You Have Been Requested To Be Teleported To By <player.name>" targets:<[player]>

tpaccept_command:
    type: command
    name: tpaccept
    description: Used To Request A Teleport
    usage: /tpaccept (name)
    script:
           - if <context.args.size> < 1:
               - narrate "<red><bold>Please Use A Name That's Online"
               - stop
           - define name <server.match_player[<context.args.get[1]>].if_null[null]>
           - if <[name]> = null:
               - narrate "<red><bold>This Is Not A Player"
               - stop
           - if <[name]> = <player.name>:
               - narrate "You Can Not Tpaccept Yourself"
               - stop
           - else:
               - narrate "<yellow>Teleporting In 3" targets:<[name]>|<player>
               - wait 1s
               - narrate "<yellow>Teleporting In 2" targets:<[name]>|<player>
               - wait 1s
               - narrate "<yellow>Teleporting In 1" targets:<[name]>|<player>
               - wait 1s
               - teleport <[name]> <player.location>
               - narrate "<green>Player Teleported"
               - stop


