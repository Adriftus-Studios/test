join_and_quit_message:
    type: world
    debug: false
    events:
        after player first login:
            - determine passively NONE
            - run welcome_message
        after player login:
            - determine passively NONE
            - run welcome_back_message
        after player quits:
            - determine passively NONE
            - run quit_message
#
welcome_message:
    type: task
    script:
        - announce "<yellow><bold><underline><player.name> has joined for the first time. Welcome!"

welcome_back_message:
    type: task
    script:
        - announce "<yellow><bold><underline>Welcome back, <player.name>!"

quit_message:
    type: task
    script:
        - announce "<yellow><bold><underline><player.name> has left the server. See you later!"