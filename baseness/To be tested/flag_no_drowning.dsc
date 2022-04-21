no_drowning:
    type: world
    debug: false
    events:
        after player changes air level:
            - while <player.oxygen.formatted> != 15:
                - oxygen 30 mode:add
#