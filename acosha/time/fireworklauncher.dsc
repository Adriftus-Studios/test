firework_launcher:
    type: item
    material: bell
    display name: <red>Firework <yellow>Launcher
    lore:
    - Shoots fireworks
    enchantments:
    - sharpness:5

firework_launcher_script:
    type: world
    events:
        after player left clicks block with:firework_launcher:
            - spawn firework <player.cursor_on>