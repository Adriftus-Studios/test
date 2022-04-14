last_died:
    type: world
    events:
        on player dies:
            - flag <player> last_died:<player.location>
# It works