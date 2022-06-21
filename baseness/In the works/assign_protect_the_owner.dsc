protect_the_owner:
    type: assignment
    debug: false
    actions:
        on assignment:
            - trigger state:true
        on entity attacks player:
            - if <context.entity> == <npc.owner>:
                - look <context.attacker>
                - attack <context.attacker>
                - flag <context.attacker> npc_attack:<npc.id>
        on entity dies flagged:npc_attack:
            - look cancel
            - attack cancel
            - flag <context.attacker> npc_attack:!
        on entity death:
            - attack <context.attacker> cancel
#