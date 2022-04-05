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
        - oxygen 120 mode:add

