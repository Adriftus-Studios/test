crayon_white:
    type: item
    material: leather_horse_armor
    display name: Crayon
    mechanisms:
        custom_model_data: 11
    recipes:
        1:
            type: shapeless
            input:
                - ||
                - |white_candle|
                - ||

crayon_Drawing:
    type: world
    events:
        on player right clicks block with:crayon_white:
        - spawn item_frame <context.location> save:crayon_white
        - adjust <entry[crayon_white].spawned_entity> visible:false
        - adjust <entry[crayon_white].spawned_entity> framed:arrow|clockwise

