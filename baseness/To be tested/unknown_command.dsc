unknown_command:
    type: world
    debug: false
    events:
        on command unknown:
            - determine "<red>Unknown command. Here's the help list:"
            - execute as_player /help