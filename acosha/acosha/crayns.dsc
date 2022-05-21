crayon_brown:
    type: item
    material: leather_horse_armor
    display name: Brown Crayon
    mechanisms:
        custom_model_data: 11
        color: blue
    recipes:
        1:
            type: shapeless
            input:
                - ||
                - |brown_candle|
                - ||
crayon_:
    type: item
    material: leather_horse_armor
    display name: Brown Crayon
    mechanisms:
        custom_model_data: 12
    recipes:
        1:
            type: shapeless
            input:
                - ||
                - |brown_candle|
                - ||

crayon_Drawing:
    type: world
    events:
        on player right clicks block with:crayon_brown:
        - spawn item_frame <context.location> save:crayon_brown
        - adjust <entry[crayon_brown].spawned_entity> visible:false
        - adjust <entry[crayon_brown].spawned_entity> color:blue
        - adjust <entry[crayon_brown].spawned_entity> framed:<item[leather_horse_armor].with[custom_model_data=20]>|clockwise

