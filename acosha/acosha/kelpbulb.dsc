kelpbulbobtain:
    type: world
    events:
        on player breaks kelp_plant:
        - drop kelp_bulb

kelp_bulb:
    type: item
    material: sugar
    display name: <yellow>Kelp Bulb

kelpbulbevents:
    type: world
    events:
        on player right clicks block with:kelp_bulb:
        - if <player.oxygen> < 6:
            - oxygen 120 mode:add
            - narrate "<green>Oxygen Added"
        - else:
            - narrate "Wait Longer"
            - stop

