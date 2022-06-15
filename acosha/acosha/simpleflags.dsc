flagremover:
    type: command
    name: flagremove
    description: remove any flag
    usage: /flagremove (name) (arg)
    permmision: *
    script:
     - if <context.args.size> < 2:
         - narrate "<red>No flag or name choosen"
         - stop
     - else:
         - define flag <context.args.get[2]>
         - define player <server.match_player[<context.args.get[1]>].if_null[null]>
         - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
         - else if <[flag]> == <player.list_flags> :
            - flag <[player]> <[flag]>:!
            - narrate "<green><[flag]> Was Removed From <[player].name>"
         - else:
            - narrate "Use a real flag"
            - stop
            

flagplayer:
    type: command
    name: flag
    description: add any flag
    usage: /flag (name) (arg)
    permmision: *
    script:
     - if <context.args.size> < 2:
         - narrate "<red>No flag or name choosen"
         - stop
     - else:
         - define flag <context.args.get[2]>
         - define player <server.match_player[<context.args.get[1]>].if_null[null]>
         - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
         - else:
            - flag <[player]> <[flag]>
            - narrate "<green><[flag]> Was added to  <[player].name>"

flaglist:
    type: command
    name: flaglist
    description: add any flag
    usage: /flaglist (name)
    permmision: *
    script:
     - if <context.args.size> < 1:
        - narrate "<aqua>Here are <player.name>'s flags<green> <player.list_flags.formatted> "
        - stop
     - else:
         - define player <server.match_player[<context.args.get[1]>].if_null[null]>
         - if <[player]> = null:
            - narrate "<red><bold>Please Use A Name That's Online"
            - stop
         - else:
            - narrate "<aqua>Here are <[player].name>'s flags<green> <player.list_flags.formatted> "



