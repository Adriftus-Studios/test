iron_shield:
    type: item
    debug: false
    material: shield
    # - durability:
    display name: <white><bold>Iron Shield
    lore:
        - <bold><red>Ma<yellow>de<red> in <red>CHI<yellow>NA!
    mechanisms:
        hides: all
        custom_model_data: 694201
    recipes:
        1:
            type: shaped
            recipe_id: iron_shield
            group: custom_shields
            output quantity: 1
            input:
                - air|iron_ingot|air
                - iron_ingot|shield|iron_ingot
                - air|iron_ingot|air
# = Insert world script for iron shield

gold_shield:
    type: item
    debug: false
    material: shield
    # - durability:
    display name: <gold><bold>Gold Shield
    lore:
        - idek lol
    mechanisms:
        hides: all
        custom_model_data: 694202
    recipes:
        1:
            type: shaped
            recipe_id: gold_shield
            group: custom_shields
            output quantity: 1
            input:
                - air|gold_ingot|air
                - gold_ingot|shield|gold_ingot
                - air|gold_ingot|air
gold_shield_world:
    type: world
    debug: false
    events:
        on player equips gold_shield:
            - while <player.has_equipped[gold_shield]>

diamond_shield:
    type: item
    debug: false
    material: shield
    # - durability:
    display name: <blue><bold>Diamond Shield
    lore:
        - idek lol
    mechanisms:
        hides: all
        custom_model_data: 694202
    recipes:
        1:
            type: shaped
            recipe_id: diamond_shield
            group: custom_shields
            output quantity: 1
            input:
                - air|diamond|air
                - diamond|shield|diamond
                - air|diamond|air
diamond_shield_effect:
    type: world
    debug: false
    events:
        on player equips diamond_shield:
            - while <player.has_equipped[diamond_shield]>:
                - adjust <player> walk_speed:0.9*<player.walk_speed>

netherite_shield:
    type: item
    debug: false
    material: shield
    # - durability:
    display name: <gray><bold>Netherite Shield
    lore:
        - idek lol
    mechanisms:
        hides: all
        custom_model_data: 694202
    recipes:
        1:
            type: shaped
            recipe_id: netherite_shield
            group: custom_shields
            output quantity: 1
            input:
                - air|netherite_ingot|air
                - netherite_ingot|shield|netherite_ingot
                - air|netherite_ingot|air
netherite_shield_world:
    type: world
    debug: false
    events:
        on player equips netherite_shield:
            - while <player.has_equipped[netherite_shield]>:
                - adjust <player> speed:0.8*<player.speed>