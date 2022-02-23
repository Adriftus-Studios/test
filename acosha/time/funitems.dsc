firework_launcher:
    type: item
    material: golden_shovel
    display name: <red>Firework <yellow>Launcher
    lore:
    - <BLUE>Shoots fireworks
torch_launcher:
    type: item
    material: golden_shovel
    display name: <red>Firework <yellow>Launcher
    lore:
    - <BLUE>Shoots fireworks
torch_launcher_script:
    type: world
    events:
        after player left clicks block with:torch_launcher:
        - modifyblock <player.cursor_on> torch


firework_launcher_script:
    type: world
    events:
        after player left clicks block with:firework_launcher:
            - ratelimit <player> 9s
            - firework <player.cursor_on> random trail primary:red fade:blue
            - wait 3s
            - firework <player.cursor_on> random trail primary:white fade:red
            - wait 3s
            - firework <player.cursor_on> random trail primary:blue fade:white
