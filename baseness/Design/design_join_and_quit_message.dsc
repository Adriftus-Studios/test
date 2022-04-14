join_and_quit_message:
    type: world
    debug: false
    events:
        on player first login:
            - determine <script[jq_messages].data_key[first_welcome]>
        on player login:
            - determine <script[jq_messages].data_key[welcome_back]>
        on player quits:
            - determine <script[jq_messages].data_key[quit]>
#
jq_messages:
    type: data
    debug: false
    quit: "<yellow><bold><underline><player.name> has left the server. See you later!"
    first_login: "<yellow><bold><underline><player.name> has joined for the first time. Welcome!"
    welcome_back: "<yellow><bold><underline>Welcome back, <player.name>!"