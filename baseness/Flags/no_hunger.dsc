no_hunger:
    type: world
    debug: false
    events:
        on player changes food level flagged:no_hunger:
            - if <context.food> < 20:
                - feed <player>
            - ratelimit <player> 2s
#Still in the works