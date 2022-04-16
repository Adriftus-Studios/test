grass_seed:
  type: item
  debug: false
  material: wheat_seeds
  display name: <&1><&l>Grass Seed
  lore:
  - "<&e>Right click <&6> to grow grass"
  mechanisms:
    hides: all
    custom_model_data: 694200
    can_place_on:
    - dirt
    - grass
    - grass_block

grass_seed_world:
    type: world
    debug: false
    events:
        on player breaks grass:
            - if <util.random_chance[0.5]>:
                - drop grass_seed <context.location>

grass_seed_grow:
    type: world
    debug: false
    events:
        on player right clicks block with:grass_seed:
            - ratelimit <player> 1t
            - define blockontop <context.location.above[1]>
            #Turns into grass_block
            - if <context.location.material.name.equals[dirt]>:
                - adjust <context.location> material:grass_block
            #Grows grass on grass block
            - else if <context.location.material.equals[grass_block]>:
                - adjust <[blockontop].material> material:grass
            #Further grows the grass
            - else if <[blockontop].material.equals[grass]>:
                - adjust <[blockontop]> material:tall_grass