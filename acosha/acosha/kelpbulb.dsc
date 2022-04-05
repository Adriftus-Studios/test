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
            - if !<player.has_flag[nobulb]>:
                - if <player.oxygen.in_seconds> < 9:
                    - oxygen 120 mode:add
                    - narrate "<green>Oxygen Added"
                    - take item:kelp_bulb
                - else:
                    - narrate "<red>Wait Longer"
                    - stop
            - else:
                - narrate "<red>Must Be Farmed From Non Player Placed Kelp"
                - stop

kelpbulbprevent:
    type: world
    events:
        on player places kelp:
            - flag <player> nobulb expire:20s
