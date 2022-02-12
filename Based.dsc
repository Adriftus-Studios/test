bob_the_npc:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - chat "Hi! I'm chatting!"
        - narrate "<green>Bob<&co> Hi! I'm narrating!"
    interact scripts:
    - 1 bob_the_npc_interact

bob_the_npc_interact:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - chat "Hello world! Also..."
                - random:
                    - chat "Hello there one!"
                    - chat "Hello there two!"
                    - chat "Hello there three!"
            chat trigger:
                1:
                    trigger: /Hello/
                    script:
                    - chat "Hello there!"
                2:
                    trigger: /Goodbye/
                    script:
                    - chat "See you!"
magic_support_bell:
    type: world
    events:
        after player right clicks bell:
        - if <player.health_percentage> < 100:
            - heal
            - actionbar "The bell has healed you!"
        - if <player.health_percentage> > 0:
            - give steak quantity:1
