firework_launcher:
    type: item
    material: golden_shovel
    display name: <red>Firework <yellow>Launcher
    lore:
    - Shoots fireworks
    enchantments:
    - sharpness:5

firework_launcher_script:
    type: world
    events:
        after player left clicks block with:firework_launcher:
            - ratelimit <player> 3s
            - wait 0.5s
            - firework <player.cursor_on> random trail flicker