crayon_item:
    type: item
    material: arrow
    display name: Crayon

crayon_Drawing:
    type: world
    events:
        on player right clicks block with:crayon_item:
        - spawn item_frame save:crayon_item
        - adjust <entry[crayon_item].spawned_entity> framed:arrow|clockwise
