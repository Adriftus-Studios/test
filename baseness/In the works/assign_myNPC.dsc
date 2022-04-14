myNPC:
    type: assignment
    debug: false
    actions:
        on assignment:
            - trigger name:click state:true
        on click:
            - if <player.uuid> == ef2ed164-08b5-45d2-b000-c9ba6cf412a4:
                - chat "Welcome back, <player.name>!"
                # | Learning list tags
            - else:
                - chat "Hi there, <player.name>!"
#