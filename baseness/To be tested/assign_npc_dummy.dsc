npc_dummy:
    type: assignment
    debug: false
    actions:
        on assignment:
            - trigger state:true
            - vulnerable state:true
        on damage:
            - chat <context.damage> targets:<player>
            - heal <npc>
#To be tested