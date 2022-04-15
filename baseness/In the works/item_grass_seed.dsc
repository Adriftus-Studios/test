grass_seed:
    type: item
    material: wheat_seeds
    display name: Grass seed
    lore:
        - idek lol

grass_seed_world:
    type: world
    events:
        on player breaks grass:
            - if <util.random_chance[0.5]>:
                - drop grass_seed <context.location>

grass_seed_grow:
    type: world
    events:
        on player right clicks block with:grass_seed:
            - ratelimit <player> 1t
            - define blockontop <context.location.above[1]>
            #Turns into grass_block
            - if <context.location.material.name.equals[dirt]>:
                - adjust <context.location> material:grass_block
            #Grows grass on grass block
            - else if <[blockontop].material.equals[grass_block]>:
                - adjust <[blockontop].material> material:grass
            #Further grows the grass
            - else if <[blockontop].material.equals[grass]>:
                - adjust <[blockontop]> material:tall_grass

#Turns dirt into grass block, then grows a grass