crayon_item:
    type: item
    material: arrow
    display name: Crayon

crayon_Drawing:
    type: world
    events:
        on player right clicks block with:crayon_item:
        - spawn item_frame <context.location> save:crayon_item
        - adjust <entry[crayon_item].spawned_entity> invisible:true
        - adjust <entry[crayon_item].spawned_entity> framed:arrow|clockwise
