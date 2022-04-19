spawn_Command:
    type: command
    debug: false
    name: spawn
    description: Spawns.
    usage: /spawn
    script:
        - teleport <context.player> spawn_location
#Approved