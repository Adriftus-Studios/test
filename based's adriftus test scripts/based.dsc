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

confirmScript_GUI:
    type: task
    script:
        - inventory open
#Incomplete
interactableTextTesting:
    type: task
    script:
        - narrate "You can <&hover[very epic].type[SHOW_TEXT]><element[click here].on_click[/spawn].type[RUN_COMMAND]><&end_hover> to /spawn!"

#Approved

spawnSheep_command:
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
# | - run confirmScriptText def:relevantTaskScript

switchGamemode:
    type: command
    name: switchGamemode
    description: Switches the player between Creative and Survival.
    usage: /switchgamemode
    aliases:
        - swgm
    permissions: modelock.creative; modelock.survival;
    permission message: <red><bold>Access denied.
    script:
        - if <player.gamemode.equals[CREATIVE]>:
            - adjust <player> gamemode:survival
            - narrate "<yellow><bold><underline>Switched to Survival mode.<reset>"
        - else if <player.gamemode.equals[SURVIVAL]>:
            - adjust <player> gamemode:creative
            - narrate "<yellow><bold><underline>Switched to Creative mode.<reset>"
#Make a menu version for other gamemodes.

selectGamemode_command:
    type: command
    name: selectGamemode
    description: Opens a menu to select a particular gamemode.
    usage: /selectgamemode
    aliases:
        - segm
    script:
        - flag player callback:<[callback]>
        - clickable selectGamemode_callback def:Creative save:Creative usages:1
        - clickable selectGamemode_callback def:Survival save:Survival usages:1
        - clickable selectGamemode_callback def:Adventure save:Adventure usages:1
        - clickable selectGamemode_callback def:Spectator save:Spectator usages:1
        - narrate "Select a gamemode:"
        - narrate "<&hover[Click here to switch to Creative mode.].type[show_text]><element[<yellow><bold><underline>[Creative]].on_click[<entry[Creative].command>]><&end_hover><reset>"
        - narrate "<&hover[Click here to switch to Survival mode.].type[show_text]><element[<yellow><bold><underline>[Survival]].on_click[<entry[Survival].command>]><&end_hover><reset>"
        - narrate "<&hover[Click here to switch to Adventure mode.].type[show_text]><element[<yellow><bold><underline>[Adventure]].on_click[<entry[Adventure].command>]><&end_hover><reset>"
        - narrate "<&hover[Click here to switch to Spectator mode.].type[show_text]><element[<yellow><bold><underline>[Spectator]].on_click[<entry[Spectator].command>]><&end_hover><reset>"
#

selectGamemode_callback:
    type: task
    definitions: gamemode
    script:
        - define bool true
        - flag player bool
        - if (<[gamemode]> == <element[Creative]>) && <[bool]>:
            - adjust <player> gamemode:creative
            - narrate "<green>You have switched to <bold><underline>Creative<reset><green> mode."
        - else if <[gamemode]> == <element[Survival]> && <[bool]>:
            - adjust <player> gamemode:survival
            - narrate "<green>You have switched to <bold><underline>Survival<reset><green> mode."
        - else if <[gamemode]> == <element[Adventure]> && <[bool]>:
            - adjust <player> gamemode:adventure
            - narrate "<green>You have switched to <bold><underline>Adventure<reset><green> mode."
        - else if <[gamemode]> == <element[Spectator]> && <[bool]>:
            - adjust <player> gamemode:spectator
            - narrate "<green>You have switched to <bold><underline>Spectator<reset><green> mode."
        - flag player bool:!

resetWorldborder:
    type: command
    name: resetworldborder
    debug: false
    description: Resets the world border for the player.
    usage: /resetworldborder
    aliases:
        - rwb
    permissions: adriftus.worldborder.reset
    permission message: <red><bold>Access denied.
    script:
        - worldborder <player> reset
        - narrate "<bold><yellow>The world border has been reset.<reset>"
#

seeInventory:
    type: command
    name: seeInventory
    definitions: name
    debug: false
    description: Displays the inventory of a player.
    usage: /seeinventory <&lt>[name]<&gt>
    aliases:
        - inventory
    permissions: adriftus.inventory.view
    tab completions:
        1: <server.match_player[[name]]>
    script:
        - inventory open destination:<server.match_player[[name]]>
#

unknownCommand:
    type: world
    events:
        on unknown command:
            - narrate "<red><bold><underline>Imagine typing an unknown command."
#