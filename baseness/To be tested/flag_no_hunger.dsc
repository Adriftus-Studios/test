no_hunger:
    type: world
    debug: false
    events:
        after player changes food level flagged:no_hunger:
            - while <context.food> < 20:
                - feed <player>
#Still in the works