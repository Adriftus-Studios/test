crayon_item:
    type: item
    material: arrow
    display name: Crayon

crayon_Drawing:
    type: world
    events:
        on player right clicks block with:crayon_item:
        - spawn item_frame <context.location> save:crayon_item
        - adjust invisible:true <entry[crayon_item].spawned_entity>
        - adjust <entry[crayon_item].spawned_entity> framed:arrow|clockwise
