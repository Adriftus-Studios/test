npc_dummy:
    type: assignment
    debug: false
    actions:
        on assignment:
            - vulnerable state:true
        on damage:
            - narrate <context.damage>
            - determine passively cancelled
#To be tested