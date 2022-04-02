heart_orb:
    type: item
    material: fire_charge
    display name: <yellow>Heart Orb
    lore:
    - <BLUE>Gives A Heart
torch_launcher_script:
    type: world
    events:
        after player left clicks block with:heart_orb:
        - ratelimit <player> 1s
        - health <player> +1