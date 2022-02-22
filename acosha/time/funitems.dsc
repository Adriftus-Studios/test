firework_launcher:
    type: item
    material: golden_shovel
    display name: <red>Firework <yellow>Launcher
    lore:
    - Shoots fireworks


firework_launcher_script:
    type: world
    events:
        after player left clicks block with:firework_launcher:
            - ratelimit <player> 3s
            - firework <player.cursor_on> random trail primary:red fade:blue
            - wait 3s
            - firework <player.cursor_on> random trail primary:white fade:red
            - wait 3s
            - firework <player.cursor_on> random trail primary:blue fade:white
