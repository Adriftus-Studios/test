firework_launcher:
    type: item
    material: golden_shovel
    display name: <red>Firework <yellow>Launcher
    lore:
    - <BLUE>Shoots fireworks
torch_launcher:
    type: item
    material: wooden_hoe
    display name: <yellow>Torch Launcher
    lore:
    - <BLUE>Shoots A Torch
torch_launcher_script:
    type: world
    events:
        after player left clicks block with:torch_launcher:
        - if <player.cursor_on.material.is_solid> :
            - modifyblock <player.cursor_on.above> torch
        - else :
            - narrate "<red>Must Be Placed On Solid Block"
            - stop



firework_launcher_script:
    type: world
    events:
        after player left clicks block with:firework_launcher:
            - ratelimit <player> 6s
            - firework <player.cursor_on> random trail primary:red fade:blue
            - wait 1.5s
            - firework <player.cursor_on> random trail primary:white fade:red
            - wait 1.5s
            - firework <player.cursor_on> random trail primary:blue fade:white

quadruple_compressed_netheriteblock:
    type: item
    material: netherite_block
    display name: <&f>Quadruple Compressed Netherite Block
    lore:
    - "<&7>6561 Netherite Block"


