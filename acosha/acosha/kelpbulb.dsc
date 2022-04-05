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
        - if <player.oxygen.in_seconds> < 9:
            - oxygen 120 mode:add
            - narrate "<green>Oxygen Added"
            - take item:kelp_bulb
        - else:
            - narrate "<red>Wait Longer"
            - stop

