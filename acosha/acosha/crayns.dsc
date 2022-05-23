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
        on player right clicks block with:crayon_brown:
        - spawn item_frame <context.location> save:crayon_brown
        - adjust <entry[crayon_brown].spawned_entity> visible:false
        - adjust <entry[crayon_brown].spawned_entity> framed:<item[leather_horse_armor].with[custom_model_data=20;color=brown]>
crayon_whitedrawing:
    type: world
    events:
        on player right clicks block with:crayon_white:
        - spawn item_frame <context.location> save:crayon
        - adjust <entry[crayon].spawned_entity> visible:false
        - adjust <entry[crayon].spawned_entity> framed:<item[leather_horse_armor].with[custom_model_data=20;color=white]>
crayon_yellowdrawing:
    type: world
    events:
        on player right clicks block with:crayon_yellow:
        - spawn item_frame <context.location> save:crayon
        - adjust <entry[crayon].spawned_entity> visible:false
        - adjust <entry[crayon].spawned_entity> framed:<item[leather_horse_armor].with[custom_model_data=20;color=yellow]>
crayon_orangedrawing:
    type: world
    events:
        on player right clicks block with:crayon_orange:
        - spawn item_frame <context.location> save:crayon
        - adjust <entry[crayon].spawned_entity> visible:false
        - adjust <entry[crayon].spawned_entity> framed:<item[leather_horse_armor].with[custom_model_data=20;color=orange]>
crayon_magentadrawing:
    type: world
    events:
        on player right clicks block with:crayon_magenta:
        - spawn item_frame <context.location> save:crayon_brown
        - adjust <entry[crayon_brown].spawned_entity> visible:false
        - adjust <entry[crayon_brown].spawned_entity> framed:<item[leather_horse_armor].with[custom_model_data=20;color=magenta]>
