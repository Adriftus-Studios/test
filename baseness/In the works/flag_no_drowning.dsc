no_drowning:
    type: world
    debug: false
    events:
        after player changes air level:
            - if <player.oxygen> < 20:
                - adjust <player> oxygen:<player.max_oxygen>
#