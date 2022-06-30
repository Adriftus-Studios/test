nuketest:
    type: world
    debug: false
    events:
         on player right clicks block with:nuke:
            - repeat 999
            - spawn PRIMED_TNT <player.location>
            - wait 1t

nuke_item:
    type: item
    material: tnt
    display name: <yellow>Nuke
