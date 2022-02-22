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
            - wait 2s
            - spawn firework <player.cursor_on>