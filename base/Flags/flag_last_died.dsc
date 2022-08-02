last_died:
    type: world
    debug: false
    events:
        on player dies:
            - flag <player> last_died:<player.location> if:<player.has_permission[adriftus.staff]>
# It works