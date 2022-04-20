npc_dummy:
    type: assignment
    debug: false
    actions:
        on assignment:
            - trigger state:true
            - vulnerable state:true
        on damage:
            - heal <npc>
            - chat <context.damage> targets:<player>
#To be tested