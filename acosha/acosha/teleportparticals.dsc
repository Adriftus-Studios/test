telepart:
    type: task
    script:
     - define particle <context.args.get[2]||spell_witch>
     - define points <player.location>
     - foreach <[points]>:
        - playeffect <[particle]> at:<[value]> quantity:100 offset:0 visibility:500
        - wait 1t