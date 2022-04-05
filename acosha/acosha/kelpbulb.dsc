kelpbulbobtain:
    type: world
    events:
        on player breaks kelp_plant:
          - if <player.has_flag[nobulb]>:
            - narrate "<red>You Must Wait 2 Hours Before Farming Again"
            - stop
            - drop kelp_bulb
          - else:
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

kelpbulbprevent:
    type: world
    events:
        on player places kelp:
            - flag <player> nobulb
