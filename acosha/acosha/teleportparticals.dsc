telepart:
    type: task
    script:
     - define particle <context.args.get[2]||spell_witch>
     - define points <proc[define_zigzag].context[<player.location>|<player.location>|2]>
     - foreach <[points]>:
        - playeffect <[particle]> at:<[value]> quantity:5 offset:0 visibility:500
        - wait 1t