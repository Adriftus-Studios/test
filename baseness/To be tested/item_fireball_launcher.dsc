fireball_launcher:
    type: item
    debug: false
    material: bow
    mechanisms:
        custom_model_data: 694207
fireball_launcher_world:
    type: world
    debug: false
    events:
        after player shoots fireballLauncher:
            - kill <context.projectile>
            - shoot <entity[FIRE_CHARGE]>
#