grass_seed:
    type: item
    material: wheat_seeds
    display name: <element[Grass seed].color_gradient[from=green;to=dark_green]>
    lore:
        - idek lol

grass_seed_world:
    type: world
    events:
        on player breaks grass:
            - if <util.random_chance[0.5]>:
                - drop grass_seed

grass_seed_grow:
    type: world
    events:
        on player right clicks grass_block with:grass_seed:
            - if <context.location.above[1].material.equals[air]>:
                - adjust <context.location.above[1].material> material:grass