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
#Approved

support_bell:
    type: item
    material: bell
    display name: <gold>Support Bell
    lore:
    - Gives you food, fills your hunger bar and fully insta-heals you!
    enchantments:
    - sharpness:5
#Incomplete
magic_replenishing_bell:
    type: world
    item: support_bell
    events:
        after player right clicks bell:
        - if <player.health_percentage> < 100:
            - heal
            - actionbar "The bell has healed you, <player.name.target>!"
            - hurt <player>
        - else if <player.has_flag[no_more]>
        - if <player.food_level> < 100 :
            - feed
            - give cooked_beef quantity:64
            - actionbar "Since you're in full health, you get a stack of steak while being fully fed!"
            - flag player no_more
#Approved, being reworked

stone_gives_diamond:
    type: world
    events:
        after player breaks stone:
        - flag player count:+:1
        - if [count] == 10:
            - drop diamond <context.location>
            - flag count 0
#Approved

cool_thing:
  type: world
  debug: false
  events:
    on player right clicks block with:item_flagged:shooter:
      - shoot <context.item.data_key[data.shoots]> speed:4
#Approved

spawn_sheep:
    type: command
    name: spawnsheep
    description: Spawns a sheep at your location.
    usage: /spawnsheep
    script:
    - if <location.forward[2].material.equals[air].not>:
        - narrate "You do not have enough space to spawn a sheep"
        - determine cancelled
    - strike <player.location.forward_flat[2]> no_damage
    - spawn sheep <player.location.forward_flat[2]>
    - narrate "Sheep spawned!"
#Approved, but not fully tested

chest_lock_item:
  type: item
  material: iron_nugget
  display name: <white>Iron Padlock
  lore:
    - <yellow><bold>Right-click a chest to lock it.

chest_lock:
    type: command
    name: chestlock
    description: Locks a chest to prevent stealing.
    usage: /chestlock | /cl
    script:
        on player looks at chest with:chest_lock_item:
            #- if <player> types "/cl" <== drafted line:
            #    - flag <player> chest_owner
            #- if <player.has_flag[chest_owner].not>:
            #    - determine passively cancelled
            #    - narrate "You do not own this chest."
#Incomplete