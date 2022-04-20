grass_seed:
  type: item
  debug: false
  material: wheat_seeds
  display name: <&1><&l>Grass Seed
  lore:
  - <&e>Right click <&6> to grow grass
  # - May need to be fixed...
  mechanisms:
    hides: all
    custom_model_data: 694200
    can_place_on:
        - dirt
        - grass
        - grass_block

grass_seed_drop:
    type: world
    debug: false
    events:
        on player breaks grass:
            - if <util.random_chance[0.5]>:
                - drop grass_seed <context.location>

grass_seed_grow:
    type: world
    debug: true
    events:
        on player right clicks block with:grass_seed:
            - ratelimit <player> 1t
            - define blockontop <context.location.above[1]>
            #Turns into grass_block
            - if <context.location.material.name> == dirt :
                - modifyblock <context.location> material:grass_block
            #Grows grass on grass block
            - if <context.location.material.name> == grass_block:
                - modifyblock <[blockontop].material> material:grass
            #Further grows the grass
            - if <context.location.material.name> == grass:
                - modifyblock <[blockontop]> material:tall_grass
