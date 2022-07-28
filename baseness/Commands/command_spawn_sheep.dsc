spawn_sheep_command:
    type: command
    debug: false
    name: spawnsheep
    description: Spawns a sheep at your location.
    usage: /spawnsheep
    script:
    - run confirm_script_text def:spawn_sheep
# It works
spawn_sheep:
    type: task
    debug: false
    script:
        - if ! ( <player.location.forward_flat[2]> ) == air:
            - strike <player.location.forward_flat[2]> no_damage
            - spawn sheep <player.location.forward_flat[2]>
            - narrate "Sheep spawned!"
        - else:
            - narrate "You do not have enough space to spawn a sheep."
            - determine passively cancelled
# It works, no changes needed