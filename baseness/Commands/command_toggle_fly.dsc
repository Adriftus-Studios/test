toggle_fly:
    type: command
    debug: false
    name: Fly
    description: Toggles fly mode.
    usage: /fly
    script:
        - adjust <player> velocity:<location[0,1,0]>
        - adjust <player> flying:true
#