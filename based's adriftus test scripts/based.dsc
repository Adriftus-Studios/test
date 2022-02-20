<<<<<<< HEAD:Based/bob_the_npc.dsc
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
magic_healing_bell:
    type: world
    events:
        after player right clicks bell:
        - if <player.health_percentage> < 100:
            - heal
            - actionbar "<&[base]>The bell has healed you!"
=======
bob_the_npc:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - chat "Hi! I'm chatting!"
        - narrate "<red>Bob<&co> Hi! I'm narrating!"
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

cool_looking_format:
    type: format
    format: <[name]> says <[text]>

support_bell:
    type: item
    material: bell
    display name: <gold>Support Bell
    lore:
    - Gives you food, fills your hunger bar and fully insta-heals you!
    enchantments:
    - sharpness:5

magic_support_bell:
    type: world
    events:
        after player right clicks bell:
        - if <player.health_percentage> < 100:
            - heal
            - actionbar "The bell has healed you!"
        - if <player.health_percentage> == 100:
            - give cooked_beef
            - actionbar "Since your health is full, you get a steak instead!"
spawn_sheep:
    type: command
    name: spawnsheep
    description: Spawns a sheep at your location.
    usage: /spawnsheep
    script:
    - strike <context.forward_flat[2]> no_damage
    - spawn sheep <context.forward_flat[2]>
    - narrate "Sheep spawned!"
>>>>>>> 325148a3e6ef81b4469e541f511de7cde5675586:based's adriftus test scripts/based.dsc
