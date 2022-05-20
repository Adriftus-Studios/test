crayon_item:
    type: item
    material: candle
    display name: Crayon

crayon_Drawing:
    type: world
    events:
        on player right clicks block with:crayon_item:
        - spawn item_frame <player.cursor_on> 
