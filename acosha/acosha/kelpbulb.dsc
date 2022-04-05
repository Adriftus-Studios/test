kelpbulbobtain:
    type: world
    events:
        on player breaks kelp_plant:
          - ratelimit <player> 5s
          - if !<player.has_flag[nobulb]>:
            - drop kelp_bulb
          - else:
                - narrate "<red>You Must Wait 2 Hours Before Farming Again"
                - stop



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
            - wait 2hr
            - flag <player> nobulb:!

