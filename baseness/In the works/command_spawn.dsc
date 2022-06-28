spawn_Command:
    type: command
    debug: false
    name: spawn
    description: Spawns.
    usage: /spawn
    script:
        - teleport <context.player> spawn_location
        # spawn_location flag needs to be set somewhere
#Approved