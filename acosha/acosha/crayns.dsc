crayon_brown:
    type: item
    material: leather_horse_armor
    display name: Brown Crayon
    mechanisms:
        custom_model_data: 18
        color: brown
    recipes:
        1:
            type: shapeless
            input:
                - ||
                - |brown_candle|
                - ||
crayon_white:
    type: item
    material: leather_horse_armor
    display name: Yellow Crayon
    mechanisms:
        custom_model_data: 18
        color: white
    recipes:
        1:
            type: shapeless
            input:
                - ||
                - |white_candle|
                - ||
crayon_yellow:
    type: item
    material: leather_horse_armor
    display name: Yellow Crayon
    mechanisms:
        custom_model_data: 18
        color: yellow
    recipes:
        1:
            type: shapeless
            input:
                - ||
                - |yellow_candle|
                - ||
crayon_orange:
    type: item
    material: leather_horse_armor
    display name: Orange Crayon
    mechanisms:
        custom_model_data: 18
        color: orange
    recipes:
        1:
            type: shapeless
            input:
                - ||
                - |Orange_candle|
                - ||
crayon_magenta:
    type: item
    material: leather_horse_armor
    display name: Magenta Crayon
    mechanisms:
        custom_model_data: 18
        color: magenta
    recipes:
        1:
            type: shapeless
            input:
                - ||
                - |Magenta_candle|
                - ||
crayon_browndrawing:
    type: world
    events:
        on player right clicks block with:crayon_*:
        - spawn item_frame <context.relative> save:crayon
        - adjust <entry[crayon].spawned_entity> visible:false
        - define color <player.item_in_hand.color>
        - adjust <entry[crayon].spawned_entity> framed:<item[leather_horse_armor].with[custom_model_data=20;color=<[color]>]>
