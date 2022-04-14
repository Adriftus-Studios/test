join_and_quit_message:
    type: world
    debug: false
    events:
        on player first login:
            - determine "<yellow><bold><player.name> has joined for the first time. Welcome!"
        on player login:
            - determine "<yellow><bold>Welcome back, <player.name>!"
        on player quits:
            - determine "<yellow><bold><player.name> has left the server. See you later!"
#