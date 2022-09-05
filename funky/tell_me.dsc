error_relay_to_funky:
    type: world
    debug: false
    events:
        after script generates error:
            - narrate <context.message> targets:<player[funky493]> if:<player[funky493].exists>
