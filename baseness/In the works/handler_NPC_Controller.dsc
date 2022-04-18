npc_controller:
    type: command
    debug: false
    name: NPC_Control
    description: Controls an NPC
    usage: /npc_control <&lt>NPC-ID<&gt>
    alias: /npcc
    tab completions:
        1: <server.npcs.formatted.name>
    script:
        # Player safety tags + Toggle
        - define NPC <npc[<context.args.get[1].uuid>]>
        #Spectate NPC
        - adjust <player> spectate:<[npc]>

NPCC_flag_removal:
    type: task
    debug: false
    script:
        # - Checks if player is spectating an NPC
        - if <player.spectator_target.is_npc>:
            - flag <player> npc_controller
        - else if !<player.spectator_target.is_npc>:
            - determine passively cancelled
            - narrate "<red>You are not spectating an NPC!"

        - if <player.has_flag[NPC_controller]>:
            - repeat <script.data_key[player_safety_tags].size>:
                - define Flags:++
                - flag <player> <script.data_key[player_safety_tags].get[<[Flags]>]>
            - adjust <player> spectate:<player>
        # - Set flags if player is not in controller mode
        - else if !<player.has_flag[NPCController]>:
            - flag <player> NPC_controller
            - adjust <player> gamemode:spectator

NPCC_chat_handler:
    type: world
    debug: false
    data:
        actions:
            - walk
            - sprint
            - jump
        directions:
            - forward
            - backward
            - left
            - right
    events:
        on player chats flagged:NPCController:
            - kill
NPCC_movement:
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
