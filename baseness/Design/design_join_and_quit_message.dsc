join_and_quit_message:
    type: world
    debug: false
    events:
        after player first login:
            - determine "<element[<bold><player.name> has joined for the first time. Welcome!].color_gradient[from=yellow;to=blue]>"
        after player login:
            - determine "<element[<bold>Welcome back, <player.name>!].color_gradient[from=yellow;to=blue]>"
        after player quits:
            - determine "<element[<bold><player.name> has left the server. See you later!].color_gradient[from=yellow;to=blue]>"
#