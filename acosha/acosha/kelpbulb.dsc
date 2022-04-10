kelpbulbobtain:
    type: world
    events:
        on player breaks kelp_plant:
            - define chance <util.random.int[1].to[15]>
            - choose  <[chance]>:
                - case 1:
                    - drop kelp_bulb
                - default:
                    - stop



kelp_bulb:
    type: item
    material: sugar
    display name: <yellow>Kelp Bulb
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
                    - narrate "<green>Oxygen Added"
                    - take item:kelp_bulb
                - else:
                    - narrate "<red>Wait Longer"
                    - stop
