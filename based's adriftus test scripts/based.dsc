bobTheNPC:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - chat "Hi! I'm chatting!"
        - narrate "<red>Bob<&co> Hi! I'm narrating!"
    interact scripts:
    - 1 bobTheNPCInteract

bobTheNPCInteract:
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

supportBell:
    type: item
    material: bell
    display name: <gold>Support Bell
    lore:
    - Gives you food, fills your hunger bar and fully insta-heals you!
    enchantments:
    - sharpness:5
magicReplenishingBell:
    type: world
    item: support_bell
    events:
        after player right clicks support_bell:
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

stoneGivesDiamond:
    type: world
    events:
        after player breaks stone:
        - flag player count:+:1
        - if [count] == 10:
            - drop diamond <context.location>
            - flag count 0
#Appproved

coolThing:
  type: world
  debug: false
  events:
    on player right clicks block with:item_flagged:shooter:
      - shoot <context.item.data_key[data.shoots]> speed:4
#Approved

chestLockItem:
  type: item
  material: iron_nugget
  display name: <white><bold>Iron Padlock
  lore:
    - <yellow><bold>Right-click a chest to lock it.

chestLock:
    type: world
    events:
        on player right clicks chest|trapped_chest|barrel with:chestLockItem:
            - determine passively cancelled
            - if <context.location.has_flag[locked_chest]>:
                - narrate "This chest is already locked."
                - stop
            - flag <context.location> locked_chest:<player.uuid>
            - if <context.location.other_block.exists>:
                - flag <context.location.other_block> locked_chest:<player.uuid>
        on player right clicks block location_flagged:locked_chest:
            - if <context.location.flag[locked_chest]> != <player.uuid>:
                - determine passively cancelled
                - narrate "This chest belongs to <context.location.flag[locked_chest].as_player.name>."
#Approved
#Issue - flag isn't deleted when chest is destroyed
#Issue - Idea isn't very clear

spawnCommand:
    type: command
    name: spawn
    description: Spawns.
    usage: /spawn
    script:
        - teleport <context.player> spawn_location
#Approved

confirmScriptGUI:
    type: task
    script:
        - inventory open
#Incomplete
interactableTextTesting:
    type: task
    script:
        - narrate "You can <&hover[very epic].type[SHOW_TEXT]><element[click here].on_click[/spawn].type[RUN_COMMAND]><&end_hover> to /spawn!"

#Approved

spawnSheepCommand:
    type: command
    name: spawnsheep
    description: Spawns a sheep at your location.
    usage: /spawnsheep
    script:
    - run confirmScriptText def:spawnSheep
# It works
spawnSheep:
    type: task
    script:
        - if <player.location.forward_flat[2].equals[air].not>:
            - strike <player.location.forward_flat[2]> no_damage
            - spawn sheep <player.location.forward_flat[2]>
            - narrate "Sheep spawned!"
        - else:
            - narrate "You do not have enough space to spawn a sheep."
            - determine passively cancelled
# It works, no changes needed

confirmScriptText:
    type: task
    definitions: callback
    script:
        - flag player callback:<[callback]>
        - clickable confirmScriptText_callback def:true save:Confirm usages:1
        - clickable confirmScriptText_callback def:false save:Cancel usages:1
        - narrate "Are you sure about this?"
        - narrate <&hover[Confirm].type[show_text]><element[<green><bold><underline>[Yes]].on_click[<entry[Confirm].command>]><&end_hover><reset>
        - narrate <&hover[Cancel].type[show_text]><element[<red><bold><underline>[No]].on_click[<entry[Cancel].command>]><&end_hover><reset>
#Very approved
confirmScriptText_callback:
  type: task
  debug: false
  definitions: bool
  script:
    - if <[bool]> && <player.has_flag[callback]>:
      - inject <player.flag[callback]>
    - else if <[bool].equals[false]>:
        - narrate <red><bold>Cancelled.<reset>
    - flag player callback:!
#Very approved
# |---          How to use the confirmation menu in other scripts (Example)         ---|
# | In command script -
# | script:
# | - run confirmScriptText def:spawnSheep

switchGamemode:
    type: command
    name: switchGamemode
    debug: false
    description: Switches the player between Creative and Survival.
    usage: /switchgamemode
    aliases:
        - sgm
    permissions: modelock.creative | modelock.survival
    script:
        - if <player.gamemode.equals[CREATIVE]>:
            - adjust <player> gamemode:survival
            - narrate "<yellow><bold><underline>Switched to Survival mode."
        - else if <player.gamemode.equals[SURVIVAL]>:
            - adjust <player> gamemode:creative
            - narrate "<yellow><bold><underline>Switched to Creative mode."

seeInventory:
    type: command
    name: seeInventory
    debug: false
    description: Displays the inventory of a player.
    usage: /seeinventory
    aliases:
        - inventory
    permissions: adriftus.inventory.view
    script:
        - inventory destination:<server.match_player>

unknownCommand:
    type: world
    events:
        on unknown command:
            - narrate "<red><bold><underline>Imagine typing an unknown command."