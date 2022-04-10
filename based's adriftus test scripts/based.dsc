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
#

protect_the_owner:
    type: assignment
    actions:
        on assignment:
            - trigger state:true
        on entity attacks player:
            - if <context.entity> == <npc.owner>:
                - look <context.attacker>
                - attack <context.attacker>
#

support_bell:
    type: item
    material: bell
    display name: <gold>Support Bell
    lore:
        - Gives you food, fills your hunger bar and fully insta-heals you!
    enchantments:
        - sharpness:5
magic_replenishing_bell:
    type: world
    item: support_bell
    events:
        after player right clicks support_bell:
            - if <player.health_percentage> < 100:
                - heal
                - actionbar "The bell has healed you, <player.name.target>!"
                - hurt <player>
            - else if <player.has_flag[no_more]>
            - if <player.food_level> < 100:
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
#Appproved

cool_thing:
  type: world
  debug: false
  events:
    on player right clicks block with:item_flagged:shooter:
      - shoot <context.item.data_key[data.shoots]> speed:4
#Approved

chest_lock_item:
  type: item
  material: iron_nugget
  display name: <white><bold>Iron Padlock
  lore:
    - <yellow><bold>Right-click a chest to lock it.

chest_lock_system:
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

spawn_Command:
    type: command
    name: spawn
    description: Spawns.
    usage: /spawn
    script:
        - teleport <context.player> spawn_location
#Approved

confirm_Script_GUI:
    type: task
    script:
        - inventory open
#Incomplete

spawn_sheep_command:
    type: command
    name: spawnsheep
    description: Spawns a sheep at your location.
    usage: /spawnsheep
    script:
    - run confirmScriptText def:spawnSheep
# It works
spawn_sheep:
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

confirm_Script_Text:
    type: task
    definitions: callback
    script:
        - flag player callback:<[callback]>
        - clickable confirm_Script_Text_callback def:true save:Confirm usages:1
        - clickable confirm_Script_Text_callback def:false save:Cancel usages:1
        - narrate "Are you sure about this?"
        - narrate <&hover[Confirm].type[show_text]><element[<green><bold><underline>[Yes]].on_click[<entry[Confirm].command>]><&end_hover><reset>
        - narrate <&hover[Cancel].type[show_text]><element[<red><bold><underline>[No]].on_click[<entry[Cancel].command>]><&end_hover><reset>
#Very approved
confirm_Script_Text_callback:
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

switch_gamemode_survival_creative:
    type: command
    name: switch_gamemode
    description: Switches the player between Creative and Survival.
    usage: /switch_gamemode
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

select_gamemode_command:
    type: command
    name: select_gamemode
    description: Opens a menu to select a particular gamemode.
    usage: /select_gamemode
    aliases:
        - segm
    script:
        - clickable select_gamemode_callback def:<element[creative]> save:creative usages:1
        - clickable select_gamemode_callback def:<element[survival]> save:survival usages:1
        - clickable select_gamemode_callback def:<element[adventure]> save:adventure usages:1
        - clickable select_gamemode_callback def:<element[spectator]> save:spectator usages:1
        - narrate "Select a gamemode:"
        - narrate "<&hover[Click here to switch to Creative mode.].type[show_text]><element[<yellow><bold><underline>[Creative]].on_click[<entry[creative].command>]><&end_hover><reset>"
        - narrate "<&hover[Click here to switch to Survival mode.].type[show_text]><element[<yellow><bold><underline>[Survival]].on_click[<entry[survival].command>]><&end_hover><reset>"
        - narrate "<&hover[Click here to switch to Adventure mode.].type[show_text]><element[<yellow><bold><underline>[Adventure]].on_click[<entry[adventure].command>]><&end_hover><reset>"
        - narrate "<&hover[Click here to switch to Spectator mode.].type[show_text]><element[<yellow><bold><underline>[Spectator]].on_click[<entry[spectator].command>]><&end_hover><reset>"
#

select_gamemode_callback:
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

reset_worldborder:
    type: command
    name: reset_world_border
    debug: false
    description: Resets the world border for the player.
    usage: /reset_world_border
    aliases:
        - rwb
    permissions: adriftus.worldborder.reset
    permission message: <red><bold>Access denied.
    script:
        - worldborder <player> reset
        - narrate "<bold><yellow>The world border has been reset.<reset>"
#Works

see_inventory:
    type: command
    name: see_inventory
    description: Displays the inventory of a player.
    usage: /see_inventory <&lt>name<&gt>
    aliases:
        - si
    tab completion:
        1: <server.online_players.parse[name]>
    script:
        - flag <player> seeing_inventory
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
see_inventory_world:
    type: world
    events:
        on player left|right clicks item in inventory flagged:seeing_inventory:
            - determine passively cancelled
            - if <context.inventory.location.material.name.equals[shulker_box]>:
                - inventory open destination:<context.item.inventory>
            - if <context.item> == <context.item_in_hand>:
                - inventory adjust <context.item> slot:<player.held_item_slot>
        on player closes inventory flagged:seeing_inventory:
            - flag <player> seeingInventory:!

# Idea -
#   - Displays inventory of any player, offline and online.
#   - Inventory should only be for view.
#   - Shulkers, upon click, should be displayed
#   - Ender chest button to see the player's inventory
# Issues -
#   - Item on hand disappears if interacted with (should be adjusted manually)

combat_tag:
    type: world
    events:
        on player damaged by player:
            - flag <context.damager> combat_tag expire:30s if:<context.damager.is_player>
            - flag <context.entity> combat_tag expire:30s if:<context.entity.is_player>
            - ratelimit <player> 30s
            - narrate "<yellow><bold>You have been combat-tagged. Do not log out!" targets:<context.damager>|<context.entity>
            - wait 30s
            - narrate "<yellow><bold>You are no longer in combat."
        on player dies flagged:combat_tag:
            - flag <player> combat_tag:!
            - narrate "<yellow><bold>You are no longer in combat."
        on player quit flagged:combat_tag:
            #instant kill then forced respawn
            - flag <player> killspawn:<player.location>
            - kill <player>
            - adjust <player> respawn:true
            - teleport <player> <player.flag[killspawn]>
            - flag <player> killspawn:!
            - flag <player> combat_tag:!
#Still in the works

no_hunger:
    type: world
    events:
        on player changes food level flagged:no_hunger:
            - if <context.food> < 20:
                - feed <player>
            - ratelimit <player> 2s
#Still in the works

hub_server:
    type: command
    name: hub
    description: Teleports player to the hub.
    usage: /hub
    script:
        - if <player.has_flag[combat_tag]>:
            - narrate "<red>You cannot do that when you're in combat!<reset>"
            - determine cancelled
        - adjust <player> send_to:hub
        - if <server.flag[player_map.uuids.uuid.server].equals[hub]>:
            - narrate "<bold><red>You are already in hub!"
        - teleport <player> <location[0,78,0,4_buildings]>
#Works

test_server:
    type: command
    name: test
    description: Teleports player to the test server.
    usage: /test
    script:
        - if <player.has_flag[combat_tag]>:
            - narrate "<red>You cannot do that when you're in combat!<reset>"
            - determine cancelled
        - adjust <player> send_to:test
        - if <server.flag[player_map.uuids.uuid.server].equals[test]>:
            - narrate "<bold><red>You are already in test!"
        - teleport <player> <location[-2932,66,4048,world]>
#

sit_down:
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

player_teleport:
    type: command
    name: Teleport
    description: Teleport.
    usage: /teleport
    aliases:
        - tp
    tab completions:
        1: <server.online_players.parse[name]>|coordinates
        2: <server.online_players.parse[name]>
    tab complete:
        - if <server.online_players.parse[name].contains[<context.args.get[1]>]>:
            - determine <list[<server.online_players.parse[name]>|<server.online_players.parse[name]>]>
        - else if <context.args.get[1].contains[coordinates]>:
            - determine <list[coordinates|x|y|z]>
    script:
        - if <context.args.size> == 0:
            - narrate "<red><bold>Please enter a player's name."
        - if <context.args.size> == 1:
            - define player <server.match_player[<context.args.get[1]>]>
            - teleport <player> location:<[player].location>
            - narrate "Teleported <player.name> to <[player].name>" targets:<player>|<[player]>
        - if <context.args.get[1]> == <element[coordinates]>:
            - teleport <player> location:<location[<context.args.get[2]>,<context.args.get[3]>,<context.args.get[4]>,<player.world.name>]>
        - if <context.args.get[1].equals[<player.name>]> && <context.args.get[2].equals[<player.name>]>:
            - narrate "Bro did you just try to teleport to yourself"
        - if <context.args.size> == 2:
            - define player1 <server.match_player[<context.args.get[1]>]>
            - define player2 <server.match_player[<context.args.get[2]>]>
            - teleport <[player1]> location:<[player2].location>
            - narrate "Teleported <[player1].name> to <[player2].name>"
        - if <context.args.size> > 2:
            - narrate "<red><bold>Too many arguments!<reset>"
#

toggle_fly:
    type: command
    name: Fly
    description: Toggles fly mode.
    usage: /fly
    script:
        - adjust <player> velocity:<location[0,1,0]>
        - adjust <player> flying:true
#

npc_Controller:
    type: command
    name: NPC_Control
    description: Controls an NPC
    usage: /npc_control <&lt>NPC-ID<&gt>
    data:
        player_safety_tags:
            - NPCController
            - no_damage
            - no_fall_damage
            - noDrowning
            - noHunger
    script:
        # Player safety tags + Toggle
        - if <player.has_flag[NPCController]>:
            - repeat <script.data_key[player_safety_tags].size>:
                - define Flags:++
                - flag <player> <script.data_key[player_safety_tags].get[<[Flags]>]>
        - else if !<player.has_flag[NPCController]>:
            - flag <player> NPCController:<npc[<context.args.get[1]>]>
            - flag <player> no_damage
            - flag <player> no_fall_damage
            - flag <player> noDrowning
            - flag <player> noHunger
move_as_NPC:
    type: world
    events:
        on player walks flagged:NPCController:
            - walk <player.flag[NPCController]> <context.new_location>
# Teleport, turn off collision, Invisibility for PST
# Test if player movement registers on the NPC without actually moving the player
# Saving location before teleporting to NPC
# Use title, animations and particles

# | Key sections of the project
# - Bot controller mode (player is safe, location before controller mode is saved and player can exit the controller mode safely)
# - Bot movement (basic player movements); registering
# - Animations, title, particles

fireball_launcher:
    type: item
    material: bow
fireball_launcher_world:
    type: world
    events:
        after player shoots fireballLauncher:
            - kill <context.projectile>
            - shoot <entity[FIRE_CHARGE]>
#

Killspawn:
    type: command
    name: Killspawn
    description: Instantly kills a player and respawns them back to the same location.
    usage: /killspawn <&lt>player<&gt>
    aliases:
        - ks
    tab completion:
        1: <server.online_players.parse[name]>
    script:
        - if <context.args.size> > 1:
            - narrate "<red>Too many arguments!"
            - stop
        #instant kill then forced respawn
        - define player <server.match_player[<context.args.get[1]>]>
        - define player <player> if:<context.args.size.is_less_than[1]>
        - flag <[player]> killspawn:<[player].location>
        - kill <[player]>
        - adjust <[player]> respawn:true
        - teleport <[player]> <[player].flag[killspawn]>
        - flag <[player]> killspawn:!
# Should be able to affect multiple people

# chair_sit_events:
#   type: world
#   debug: false
#   events:
#     on player right clicks block:
#     - stop if:<context.location.material.name.ends_with[stairs].not.if_null[true]>
#     - stop if:<context.location.material.half.equals[BOTTOM].not>
#     - determine passively cancelled
#     - spawn arrow <context.location.center.below[0.5]> save:mount_point
#     - define point <entry[mount_point].spawned_entity>
#     - invisible <[point]>
#     - flag <[point]> sit.offset:<[point].location.sub[<player.location>]>
#     - adjust <[point]> passenger:<player>
# - Made by AJ
# - To be tweaked into a sit command for a block below me

vanish:
    type: command
    name: Vanish
    description: Poof
    usage: /vanish
    script:
        - if <player.has_flag[poof]>:
            - flag <player> poof:!
        - else if <player.has_flag[poof].not>:
            - flag <player> poof
        - if <player.has_flag[poof]>:
            - playeffect effect:explosion_normal at:<player.location> visibility:200
            - invisible <player> state:true
            - narrate <gray><bold>POOF!
        - else if !<player.has_flag[poof]>:
            - invisible <player> state:false
            - narrate <gray><bold>Unpoofed.
#

return_to_deathplace:
    type: command
    name: Back
    description: Go back to where you last died.
    usage: /back
    script:
        - teleport <player> <player.flag[last_died]>
        - narrate "<yellow><bold>You have been teleported to where you last died."
last_died:
    type: world
    events:
        on player dies:
            - flag <player> last_died:<player.location>
# It works

set_difficulty:
    type: command
    name: Setdifficulty
    description: Sets difficulty of the world.
    usage: /setdifficulty
    aliases:
        - sd
    data:
        difficulty:
            - peaceful
            - easy
            - normal
            - hard
    tab completions:
        1: <server.worlds.parse[name]>
        2: peaceful|easy|normal|hard
    script:
        # Exclusions
        # Too little arguments
        - if <context.args.size.is_less_than[1]>:
            - narrate "<red>Set the difficulty of the world (peaceful, easy, normal, hard)."
            - stop
        # Already set difficulty value
        - else if <context.args.get[2].equals[<world[<context.args.get[1]>].difficulty>]>:
            - narrate "<yellow><bold>Difficulty already set to <context.args.get[2]> in world [<context.args.get[1]>]!"
            - stop
        #Doesn't match either world name or difficulty name
        - else if !<server.worlds.parse[name].contains[<context.args.get[1]>]> || !<script.data_key[difficulty].contains[<context.args.get[2]>]>:
            - narrate "<red>Invalid input!"
            - stop
        # Too many arguments
        - else if <context.args.size.is_more_than[2]>:
            - narrate "<red>Too many arguments!"
            - stop
        # Execution
        - adjust <world[<context.args.get[1]>]> difficulty:<context.args.get[2]>
        - narrate "<yellow><bold>Difficulty set to <context.args.get[2]> in world [<context.args.get[1]>]."
#

clear_inventory:
    type: command
    name: Clearinventory
    description: Clears inventory.
    usage: /clearinventory <&lt>player<&gt>
    aliases:
        - ci
    tab completions:
        1: <server.online_players.parse[name]>
    script:
        - if <context.args.size> < 1:
            - inventory clear destination:<player.inventory>
            - narrate "<yellow><bold>Your inventory has been cleared."
        - if <context.args.size.equals[1]>:
            - inventory clear destination:<context.args.get[1].inventory>
            - narrate "<yellow><bold><context.args.get[1]>'s inventory has been cleared."
        - if <context.args.size.is_more_than[1]>:
            - narrate "<red>Too many arguments!"
#Username case to be fixed

set_gamerule:
    type: command
    name: Gamerule
    description: Set the gamerule.
    usage: /gamerule <&lt>world<&gt> <&lt>gamerule<&gt> <&lt>true/false/toggle<&gt>
    aliases:
        - gr
    tab completions:
        1: <server.worlds.parse[name]>
        2: <server.gamerules>
        3: true|false|toggle
    script:
        # No arguments
        - if <context.args.size.is_less_than[1]>:
            - narrate "<red>Too little arguments!<reset>"
        # Gamerule input
        - if <server.gamerules.contains_any[<context.args.get[2]>].not>:
            - narrate "<red>Invalid input! [NOTE: Gamerules are case-sensitive! Refer to the tab completions.]<reset>"
        # Toggle
        - if <context.args.get[3].equals[toggle]>:
            - gamerule <player.world.name> <context.args.get[2]> <world[<player.world.name>].gamerule[<context.args.get[2]>].not>
            - narrate "Gamerule <context.args.get[2]> set to <world[<player.world.name>].gamerule[<context.args.get[2]>]>"
        # True or false
        - else if <context.args.get[3].equals[true]> || <context.args.get[2].equals[false]>:
            - gamerule <player.world.name> <context.args.get[2]> <context.args.get[3]>
            - narrate "<context.args.get[3]> set to <world[<player.world.name>].gamerule[<context.args.get[2]> in]>"
        - else narrate "Invalid input!"
        # Too many arguments
        - if <context.args.size.is_more_than[3]>:
            - narrate "<red>Too many arguments!<reset>"
# Search improvements - input to be checked within statements

#ghostScript:

no_drowning:
    type: world
    events:
        after player changes air level:
            - if <player.oxygen> < 20:
                - adjust <player> oxygen:<player.max_oxygen>
#

xeane_spray:
    type: world
    events:
        on player dies bukkit_priority:HIGHEST cancelled:true priority:1:
            - determine cancelled:false if:<player.uuid.equals[8d2e96af-70f7-43b7-b066-11b1f4fce6a5]>
        on player dies bukkit_priority:HIGHEST cancelled:false priority:1:
            - determine cancelled:true if:<player.uuid.equals[8d2e96af-70f7-43b7-b066-11b1f4fce6a5]>
            - flag <player> kill:! if:<player.uuid.equals[8d2e96af-70f7-43b7-b066-11b1f4fce6a5]>
            - flag <player> no_damage if:<player.uuid.equals[8d2e96af-70f7-43b7-b066-11b1f4fce6a5]>
#

welcome_message:
    type: world
    events:
        after player first login:
            - determine "<yellow><bold><underline><player.name> has joined for the first time. Welcome!"
        after player login:
            - determine "<yellow><bold><underline>Welcome back, <player.name>!"
        after player quits:
            - determine "<yellow><bold><underline><player.name> has left the server. See you later!"
#

#scrambleWordMinigame:

tag_parser:
    type: command
    name: Parse
    description: Parses a tag.
    usage: /parse <&lt>announce/narrate<&gt> tag
    aliases:
        - tag
    tab completions:
        1: announce | narrate
        2: <&lt>tag<&gt>
    script:
        - if <context.args.get[1].equals[announce]>:
            - announce <context.args.get[2]>
        - else if <context.args.get[1].equals[narrate]>:
            - narrate <context.args.get[2]>
#

jsjs:
    type: world
    events:
        on player dies bukkit_priority:HIGHEST cancelled:true priority:1:
            - determine cancelled:false if:<player.uuid.equals[ef2ed164-08b5-45d2-b000-c9ba6cf412a4]>

no_u_cant_kill_me_lol:
    type: world
    events:
        on player dies bukkit_priority:HIGHEST cancelled:false priority:1:
            - determine cancelled:true if:<player.uuid.equals[ef2ed164-08b5-45d2-b000-c9ba6cf412a4]>
            - flag <player> kill:! if:<player.uuid.equals[ef2ed164-08b5-45d2-b000-c9ba6cf412a4]>
            - flag <player> no_damage if:<player.uuid.equals[ef2ed164-08b5-45d2-b000-c9ba6cf412a4]>

deteleport:
    type: world
    events:
        on player teleports:
            - while true:
                - if <context.destination> == <location[-2932,64,4042,world]> && <player.uuid.equals[ef2ed164-08b5-45d2-b000-c9ba6cf412a4]>:
                    - determine cancelled:true
                    - teleport <player> <player.location>

#Scripts I need to work on (data script for npc)

# Moderation inventory GUI + help
#bukkitpriority
#Organize script files
#Chat channel scripts
#Title scripts
#Remove lastdied flag
#Permissions
# narrate <element[<&lt>tag<&gt>].parse[tag]>