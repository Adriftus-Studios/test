npc_Controller:
    type: command
    debug: false
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
    debug: false
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
