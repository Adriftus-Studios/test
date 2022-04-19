npc_dummy:
    type: assignment
    debug: false
    actions:
        on damage:
            - narrate <context.damage>
            - determine cancelled
#To be tested