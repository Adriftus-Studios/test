npc_dummy:
    type: assignment
    debug: false
    actions:
        on assignment:
            - vulnerable state:true
        after damage:
            - chat <context.damage> targets:<player>
            - heal <npc>
#To be tested