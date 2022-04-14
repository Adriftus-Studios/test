welcome_message:
    type: world
    debug: false
    events:
        after player first login:
            - determine "<yellow><bold><underline><player.name> has joined for the first time. Welcome!"
        after player login:
            - determine "<yellow><bold><underline>Welcome back, <player.name>!"
        after player quits:
            - determine "<yellow><bold><underline><player.name> has left the server. See you later!"
#