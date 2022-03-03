
test_effects_command:
  type: command
  debug: false
  description: does fancies
  usage: /test_effects
  name: test_effects
  tab complete:
  - if <context.args.is_empty>:
    - determine <list[curve1|curve2|star1|star2|circle|spiral|zigzag|sphere1|sphere2].filter[starts_with[<context.args.get[1]>]]||<list[curve|star1|star2|circle|spiral|zigzag|sphere1|sphere2]>>
  - else:
    - determine <server.particle_types.parse[to_lowercase].filter[starts_with[<context.args.get[2]||<server.particle_types>>]]>
  script:
  - define particle <context.args.get[2]||spell_witch>
  - if <context.args.get[1]> == zigzag:
    - define points <proc[define_zigzag].context[<player.location>|<player.location.forward[20]>|2]>
    - foreach <[points]>:
      - playeffect <[particle]> at:<[value]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == curve1:
    - define start <player.location>
    - define end <player.location.forward[20]>
    - repeat 90:
      - define points <proc[define_curve1].context[<[start]>|<[end]>|5|<[value].mul[4]>|1]>
      - playeffect <[particle]> at:<[points]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == curve2:
    - define start <player.location>
    - define end <player.location.forward[20]>
    - narrate "not done yet"
  - if <context.args.get[1]> == star1:
    - define points <proc[define_star].context[<player.location.forward[4]>|3|90|5]>
    - repeat <[points].size>:
      - playeffect <[particle]> at:<[points].get[<[value]>]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == star2:
    - define num 5
    - define points <proc[define_star2].context[<player.location.forward[4]>|3|90|<[num]>]>
    - repeat <[points].size.div[<[num]>]>:
      - repeat <[num]>:
        - playeffect <[particle]> at:<[points].get[<[value].mul[<[num]>].add[<[value]>]>]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == sphere1:
    - define points <proc[define_sphere1].context[<player.location.forward[4]>|2|0.5]>
    - playeffect redstone <[points]> offset:0 visibility:300 quantity:1 special_data:1|<color[255,0,0]>
  - if <context.args.get[1]> == sphere2:
    - define layers <proc[define_sphere2].context[<player.location.above>|2|0.5]>
    - define center <player.location>
    - repeat 5:
      - repeat <[layers].size>:
        - define offset <[center].sub[<player.location>]>
        - define points <[layers].get[<[value]>]>
        - define points <[points].include_single[<[layers].get[<[layers].size.sub[<[value]>]>]>]>
        - playeffect redstone at:<[points].parse[sub[<[offset]>]]> quantity:1 offset:0 visibility:100 special_data:1|<color[91,225,245]>
        - wait 2t
  - if <context.args.get[1]> == circle:
    - define points <proc[define_circle].context[<player.location.forward[4]>|3]>
    - foreach <[points]>:
      - playeffect <[particle]> at:<[value]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == spiral:
    - define points <proc[define_spiral].context[<player.location>|<player.location.forward[20]>|0.5|0]>
    - foreach <[points]> as:point:
      - playeffect <[particle]> at:<[point]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == cone1:
    - define start <player.location>
    - define end <player.location.forward[20]>
    - define points <proc[define_cone1].context[<[start].above>|<[end]>|20|1]>
    - narrate <[points].size>
    - repeat 1:
      - playeffect <[particle]> at:<[points]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == cone2:
    - define start <player.location>
    - define end <player.location.forward[20]>
    - define layers <proc[define_cone2].context[<[start].above>|<[end]>|20|1]>
    - narrate <[layers].size>
    - foreach <[layers]> as:layer:
      - playeffect <[particle]> at:<[layer]> quantity:5 offset:0 visibility:100
      - wait 1t
