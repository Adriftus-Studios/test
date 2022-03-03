telepart:
    type: task
    script:
     - define particle <context.args.get[2]||spell_witch>
     - define points <player.location>
     - foreach <[points]>:
        - playeffect <[particle]> at:<[value]> quantity:200 offset:0.6 visibility:5
        - wait 1t