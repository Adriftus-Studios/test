npc_dummy:
    type: assignment
    debug: false
    actions:
        on assignment:
            - trigger state:true
            - vulnerable state:true
        on damage:
            - determine passively cancelled
            - narrate <context.damage> targets:<player>
#To be tested