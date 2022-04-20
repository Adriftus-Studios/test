grass_seed:
  type: item
  debug: false
  material: wheat_seeds
  display name: <&6>Grass Seed
  lore:
  - <&e>Right click <&6>to grow grass
  mechanisms:
    hides: all
    custom_model_data: 2

grass_seed_drop:
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
        on player right clicks dirt|grass|grass_block with:grass_seed:
            - ratelimit <player> 5t
            - define blockontop <context.location.above[1]>
            - playsound sound:BLOCK_GRASS_PLACE <player.location>
            #Turns into grass_block
            - choose <context.location.material.name>:
                - case dirt:
                    - modifyblock <context.location> material:grass_block
                #Grows grass on grass block
                - case grass_block:
                    - modifyblock <[blockontop]> material:grass
                #Further grows the grass
                - case grass:
                    - modifyblock <context.location> material:tall_grass no_physics
                    - modifyblock <[blockontop]> material:tall_grass no_physics
                    - adjustblock <[blockontop]> half:top no_physics
            - take iteminhand quantity:1
