no_drowning:
    type: world
    debug: false
    events:
        after player changes air level:
            - while <player.oxygen> > 20:
                - adjust <player> oxygen:<player.max_oxygen>
#