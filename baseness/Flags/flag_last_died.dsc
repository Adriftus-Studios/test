last_died:
    type: world
    debug: false
    events:
        on player dies:
            - flag <player> last_died:<player.location>
# It works