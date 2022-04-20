npc_dummy:
    type: assignment
    debug: false
    actions:
        on assignment:
            - vulnerable state:true
            - flag <npc> no_damage
        on damage:
            - chat <context.damage> targets:<player>
            - determine cancelled
#To be tested