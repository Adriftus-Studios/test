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
        on entity death:
            - attack <context.attacker> cancel
#