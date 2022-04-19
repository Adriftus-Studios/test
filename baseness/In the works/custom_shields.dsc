iron_shield:
    type: item
    debug: false
    material: shield
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