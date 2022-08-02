no_hunger:
    type: world
    debug: false
    events:
        after player changes food level flagged:no_hunger:
            - ratelimit <player> 20s
            - if <context.food> < 20:
                - feed <player> saturation:20 amount:20
#Still in the works