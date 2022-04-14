fireball_launcher:
    type: item
    debug: false
    material: bow
fireball_launcher_world:
    type: world
    debug: false
    events:
        after player shoots fireballLauncher:
            - kill <context.projectile>
            - shoot <entity[FIRE_CHARGE]>
#