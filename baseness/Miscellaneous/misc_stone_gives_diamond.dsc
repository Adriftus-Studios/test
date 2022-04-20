stone_gives_diamond:
    type: world
    debug: false
    events:
        after player breaks stone:
        - flag <player> count:+:1
        - if <player.flag[count]> == 10:
            - drop diamond <context.location>
            - flag <player> count 0
#Approved