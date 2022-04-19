vanish:
    type: command
    debug: false
    name: Vanish
    description: Poof
    usage: /vanish
    script:
        # Toggles vanish flag
        - if <player.has_flag[poof]>:
            - flag <player> poof:!
        - else if !<player.has_flag[poof]>:
            - flag <player> poof
        # Checks vanish flag
        - if <player.has_flag[poof]>:
            - playeffect effect:explosion_normal at:<player.location> visibility:200
            - adjust <player> hide_from_players
            - narrate <gray><bold>POOF!
        - else if !<player.has_flag[poof]>:
            - adjust <player> show_to_players
            - narrate <gray><bold>Unpoofed.
#Speeding smoke effect?