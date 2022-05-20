toggle_fly:
    type: command
    debug: false
    name: Fly
    description: Toggles fly mode.
    usage: /fly
    script:
        - if <player.standing_on.material.is_solid>:
            - adjust <player> velocity:<location[0,1,0]>
        - adjust <player> can_fly:true
        - adjust <player> flying:true
#