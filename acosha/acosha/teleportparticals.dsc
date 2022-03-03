
TELEPORT_part:
    type: world
    events:
        on player teleports:
            - wait 1s
            - run telepart
    



telepart:
    type: task
    script:
     - define particle <context.args.get[2]||spell_witch>
     - define points <player.location>
     - foreach <[points]>:
        - playeffect <[particle]> at:<[value]> quantity:200 offset:0.6 visibility:500
        - wait 1.5s
        - playeffect <[particle]> at:<[value]> quantity:75 offset:0.6 visibility:250
        - wait 1.5s
        - playeffect <[particle]> at:<[value]> quantity:25 offset:0.6 visibility:100