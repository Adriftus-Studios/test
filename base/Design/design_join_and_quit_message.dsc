join_and_quit_message:
    type: world
    debug: false
    events:
        on player first login:
            - run first_login
        on player joins:
            - run welcome_back
        on player quits:
            - run quit_message
#

first_login:
    type: task
    debug: false
    script:
        - determine "<element[<bold><player.name> has joined for the first time. Welcome!].color_gradient[from=yellow;to=blue]>"
        - title title: <element[<bold>Welcome!].color_gradient[from=yellow;to=blue]>

welcome_back:
    type: task
    debug: false
    script:
        - determine "<element[<bold>Welcome back, <player.name>!].color_gradient[from=yellow;to=blue]>"
        - title title: "<element[<bold>Welcome back!].color_gradient[from=yellow;to=blue]>"

quit_message:
    type: task
    debug: false
    script:
        - determine "<element[<bold><player.name> has left the server. See you later!].color_gradient[from=yellow;to=blue]>"