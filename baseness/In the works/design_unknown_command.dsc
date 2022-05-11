unknown_command:
    type: world
    debug: false
    events:
        on command unknown:
            - determine "<red>Unknown command."
            - execute as_player /help save:output
            - narrate <entry[output].output>