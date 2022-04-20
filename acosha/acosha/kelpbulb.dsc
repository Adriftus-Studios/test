kelpbulbobtain:
    type: world
    events:
        on player breaks kelp_plant:
            - define chance <util.random.int[1].to[15]>
            - choose  <[chance]>:
                - case 1:
                    - determine kelp_bulb
                - default:
                    - stop



kelp_bulb:
    type: item
    material: sugar
    display name: <yellow>Kelp Bulb
    lore:
    - <&6>The root of a kelp plant.
    - <&e>Right click <&6>to breathe the air within
    data:
        recipe_book_category: misc.kelp_bulb
    recipes:
        1:
            type: shaped
            output_quantity: 1
            input:
            - material:kelp|material:kelp|material:kelp
            - material:kelp|material:air|material:kelp
            - material:kelp|material:kelp|material:kelp


kelpbulbevents:
    type: world
    events:
        on player right clicks block with:kelp_bulb:
                - if <player.oxygen.in_seconds> < 9:
                    - oxygen 120 mode:add
                    - take iteminhand quantity:1
                    - playsound sound:ENTITY_PLAYER_BURP <player>
                - else:
                    - actionbar "<red>Wait Longer"
                    - stop

