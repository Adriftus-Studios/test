# Hi! You're looking at a file that has every single script I've made with the help of my co-workers at Adriftus Studios!

myNPC:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - if <player.uuid> == ef2ed164-08b5-45d2-b000-c9ba6cf412a4:
            - chat "Welcome back, <player.name>! You have scripts to work on - "
            # | Learning list tags
        - else:
            - chat "Hi there, <player.name>!"

protectTheOwner:
    type: assignment
    actions:
        on assignment:
        - trigger state:true
        on entity attacks player:
            - if <context.entity> == <npc.owner>:
                - look <context.attacker>
                - attack <context.attacker>
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

switchGamemodeSurvivalCreative:
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
        - clickable selectGamemode_callback def:<element[creative]> save:creative usages:1
        - clickable selectGamemode_callback def:<element[survival]> save:survival usages:1
        - clickable selectGamemode_callback def:<element[adventure]> save:adventure usages:1
        - clickable selectGamemode_callback def:<element[spectator]> save:spectator usages:1
        - narrate "Select a gamemode:"
        - narrate "<&hover[Click here to switch to Creative mode.].type[show_text]><element[<yellow><bold><underline>[Creative]].on_click[<entry[creative].command>]><&end_hover><reset>"
        - narrate "<&hover[Click here to switch to Survival mode.].type[show_text]><element[<yellow><bold><underline>[Survival]].on_click[<entry[survival].command>]><&end_hover><reset>"
        - narrate "<&hover[Click here to switch to Adventure mode.].type[show_text]><element[<yellow><bold><underline>[Adventure]].on_click[<entry[adventure].command>]><&end_hover><reset>"
        - narrate "<&hover[Click here to switch to Spectator mode.].type[show_text]><element[<yellow><bold><underline>[Spectator]].on_click[<entry[spectator].command>]><&end_hover><reset>"
#

selectGamemode_callback:
    type: task
    definitions: gamemode
    script:
        - flag player callback:<[callback]>
        - else if <[gamemode]> == <element[creative]> && <player.has_flag[callback]>:
            - adjust <player> gamemode:creative
            - narrate "<green>You have switched to <bold><underline>Creative<reset><green> mode."
            - flag player callback:!
        - else if <[gamemode]> == <element[survival]> && <player.has_flag[callback]>:
            - adjust <player> gamemode:survival
            - narrate "<green>You have switched to <bold><underline>Survival<reset><green> mode."
            - flag player callback:!
        - else if <[gamemode]> == <element[adventure]> && <player.has_flag[callback]>:
            - adjust <player> gamemode:adventure
            - narrate "<green>You have switched to <bold><underline>Adventure<reset><green> mode."
            - flag player callback:!
        - else if <[gamemode]> == <element[spectator]> && <player.has_flag[callback]>:
            - adjust <player> gamemode:spectator
            - narrate "<green>You have switched to <bold><underline>Spectator<reset><green> mode."
            - flag player callback:!
#Not working; for testing only

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
#Works

seeInventory:
    type: command
    name: seeInventory
    description: Displays the inventory of a player.
    usage: /seeinventory <&lt>name<&gt>
    aliases:
        - inventory
        - si
    tab completion:
        1: <server.online_players>
    script:
        - flag <player> seeingInventory
        - if <context.args.size> < 1:
            - inventory open destination:<player>
            - stop
        - define player <server.match_player[<context.args.get[1]>]>
        #.if_null[null]>
        #- if <[player]> = null:
        #    - narrate "<red>Use an online player's name.<reset>"
        #    - stop
        - inventory open destination:<[player].inventory>
        - narrate "<yellow>Opening inventory<reset>"
seeInventoryWorld:
    type: world
    events:
        on player left|right clicks item in inventory flagged:seeingInventory:
            - determine passively cancelled
            - if <context.inventory.location.material.name.equals[shulker_box]>:
                - inventory open destination:<context.item.inventory>
            - if <context.item> == <context.item_in_hand>:
                - inventory adjust <context.item> slot:<player.held_item_slot>
        on player closes inventory flagged:seeingInventory:
            - flag <player> seeingInventory:!

# Idea -
#   - Displays inventory of any player, offline and online.
#   - Inventory should only be for view.
#   - Shulkers, upon click, should be displayed
#   - Ender chest button to see the player's inventory
# Issues -
#   - Item on hand disappears if interacted with (should be adjusted manually)

combatTag:
    type: world
    events:
        on player damaged by player:
            - flag <context.damager> combatTag expire:30s if:<context.damager.is_player>
            - flag <context.entity> combatTag expire:30s if:<context.entity.is_player>
            - narrate "You have been combat-tagged. Do not log out!" targets:<context.damager>|<context.entity>
        on player dies flagged:combatTag:
            - flag <player> combatTag:!
        on player quit flagged:combatTag:
            - kill <player>
            - flag <player> combatTag:!
#Still in the works

noHunger:
    type: world
    events:
        on player changes food level flagged:noHunger:
            - if <context.food> < 20:
                - feed <player>
#Still in the works

hubCommand:
    type: command
    name: hub
    description: Teleports player to the hub.
    usage: /hub
    script:
        - if <player.has_flag[combatTag]>:
            - narrate "<red>You cannot do that when you're in combat!<reset>"
            - determine cancelled
        - adjust <player> send_to:hub
        - if <server.flag[player_map.uuids.uuid.server].equals[hub]>:
            - narrate "<bold><red>You are already in hub!"
        - teleport <player> <location[0,78,0,4_buildings]>
#Works

testCommand:
    type: command
    name: test
    description: Teleports player to the test server.
    usage: /test
    script:
        - if <player.has_flag[combatTag]>:
            - narrate "<red>You cannot do that when you're in combat!<reset>"
            - determine cancelled
        - adjust <player> send_to:test
        - if <server.flag[player_map.uuids.uuid.server].equals[test]>:
            - narrate "<bold><red>You are already in test!"
        - teleport <player> <location[-2932,66,4048,world]>
#

sitCommand:
    type: command
    name: Sit
    description: Makes the player sit down on a block.
    usage: /sit
    script:
        - if !<player.has_flag[sitting]>:
            - flag <player> sitting
            - teleport <player> <location[<player.location.x.round>,<player.location.y.round>,<player.location.z.round>]>
            - animate <player> animation:sit
        - if <player.has_flag[sitting]>:
            - animate <player> animation:stand
            - flag <player> sitting:!
#In case of a glitch (likely on the second attempt), kick yourself.

tpCommand:
    type: command
    name: Teleport
    description: Teleport.
    usage: /teleport
    aliases:
        - tp
    tab completions:
        1: <server.online_players>|coordinates
        2: <server.online_players>|x
        3: y
        4: z
    tab complete:
        - determine <server.online_players.parse[name]>|<server.online_players.parse[name]>
        - determine coordinates|x|y|z
    script:
        - if <context.args.size> == 0:
            - narrate "<red><bold>Please enter a player's name."
        - if <context.args.size> == 1:
            - define player <server.match_player[<context.args.get[1]>]>
            - teleport <player> location:<[player].location>
            - narrate "Teleported <player.name> to <[player].name>" targets:<player>|<[player]>
        - if <context.args.get[1]> == <element[coordinates]>:
            - teleport <player> location:<location[<context.args.get[2]>,<context.args.get[3]>,<context.args.get[4]>,<player.world.name>]>

        - if <context.args.size> == 2:
            - define player1 <server.match_player[<context.args.get[1]>]>
            - define player2 <server.match_player[<context.args.get[2]>]>
            - teleport <[player1]> location:<[player2].location>
            - narrate "Teleported <[player1].name> to <[player2].name>"
        - if <context.args.size> > 2:
            - narrate "<red><bold>Too many arguments!<reset>"

flyCommand:
    type: command
    name: Fly
    description: Toggles fly mode.
    usage: /fly
    script:
        - adjust <player> velocity:<location[0,1,0]>
        - adjust <player> flying:true
#

moveAsNPC:
    type: world
    events:
        on player spectates entity:
            - flag <player> spectatingEntity
        on player stops spectating entity:
            - flag <player> spectatingEntity:!

fireballLauncher:
    type: item
    material: bow
fireballLauncherScript:
    type: world
    events:
        after player shoots fireballLauncher:
            - kill <context.projectile>
            - shoot <entity[FIRE_CHARGE]>

Killspawn:
    type: command
    name: Killspawn
    description: Instantly kills a player and respawns them back to the same location.
    usage: /killspawn <&lt>player<&gt>
    tab completion:
        1: <server.online_players>
    script:
        - define player <context.args.get[1]>
        - flag <[player]> killspawn:<[player].location>
        - kill <[player]>
        - adjust <[player]> respawn:true
        - teleport <[player]> <[player].flag[killspawn]>
        - flag <[player]> killspawn:!

vanishCommand:
    type: command
    name: Vanish
    description: Poof
    usage: /vanish
    script:
        - if !<player.has_flag[poof]>:
            - flag <player> poof:true
        - if <player.has_flag[poof]>:
            - flag <player> poof:false
        - invisible <player> state:<player.flag[poof]>
#returnDeathCommand:
#    type: command
#    name: Back
#    description: Go back to where you last died.
#    usage: /back
#    script:


#difficultyCommand:

#clearInventory: