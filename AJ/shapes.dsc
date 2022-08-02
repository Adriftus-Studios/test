
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
    - define start <player.location>
    - define end <player.location.forward[20]>
    - define points 5
    - define points <proc[define_zigzag].context[<[start]>|<[end]>|<[points]>]>
    - foreach <[points]>:
      - playeffect <[particle]> at:<[value]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == curve1:
    - define start <player.location>
    - define end <player.location.forward[20]>
    - define severity 5
    - define between 1
    - repeat 90:
      - define angle <[value].mul[4]>
      - define points <proc[define_curve1].context[<[start]>|<[end]>|<[severity]>|<[angle]>|<[between]>]>
      - playeffect <[particle]> at:<[points]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == star1:
    - define location <player.location.forward[4]>
    - define radius 3
    - define points 5
    - define drawn <proc[define_star].context[<[location]>|<[radius]>|90|<[points]>]>
    - foreach <[drawn]> as:point:
      - playeffect <[particle]> at:<[point]> quantity:5 offset:0 visibility:100
      - wait 1t
  # - if <context.args.get[1]> == star2:
  #   - define num 5
  #   - define points <proc[define_star2].context[<player.location.forward[4]>|3|90|<[num]>]>
  #   - repeat <[points].size.div[<[num]>]>:
  #     - repeat <[num]>:
  #       - playeffect <[particle]> at:<[points].get[<[value].mul[<[num]>].add[<[value]>]>]> quantity:5 offset:0 visibility:100
  #     - wait 1t
  - if <context.args.get[1]> == sphere1:
    - define location <player.location.forward[4]>
    - define radius 2
    - define between 0.5
    - define points <proc[define_sphere1].context[<[location]>|<[radius]>|<[between]>]>
    - playeffect redstone <[points]> offset:0 visibility:300 quantity:1 special_data:1|<color[255,0,0]>
  - if <context.args.get[1]> == sphere2:
    - define location <player.location.above>
    - define radius 2
    - define between 0.5
    - define layers <proc[define_sphere2].context[<[location]>|<[radius]>|<[between]>]>
    - define center <player.location>
    - repeat 5:
      - repeat <[layers].size>:
        - define offset <[center].sub[<player.location>]>
        - define points <[layers].get[<[value]>]>
        - define points <[points].include_single[<[layers].get[<[layers].size.sub[<[value]>]>]>]>
        - playeffect redstone at:<[points].parse[sub[<[offset]>]]> quantity:1 offset:0 visibility:100 special_data:1|<color[91,225,245]>
        - wait 2t
  - if <context.args.get[1]> == circle:
    - define location <player.location.forward[4]>
    - define radius 2
    - define points <proc[define_circle].context[<[location]>|<[radius]>]>
    - foreach <[points]>:
      - playeffect <[particle]> at:<[value]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == spiral:
    - define start <player.location>
    - define end <player.location.forward[20]>
    - define radius 0.5
    - define angle_offset 0
    - define points <proc[define_spiral].context[<[start]>|<[end]>|<[radius]>|<[angle_offset]>]>
    - foreach <[points]> as:point:
      - playeffect <[particle]> at:<[point]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == cone1:
    - define start <player.location.above>
    - define end <player.location.forward[20]>
    - define angle 20
    - define between 1
    - define points <proc[define_cone1].context[<[start]>|<[end]>|<[angle]>|<[between]>]>
    - narrate <[points].size>
    - repeat 1:
      - playeffect <[particle]> at:<[points]> quantity:5 offset:0 visibility:100
      - wait 1t
  - if <context.args.get[1]> == cone2:
    - define start <player.location.above>
    - define end <player.location.forward[20]>
    - define angle 20
    - define between 1
    - define layers <proc[define_cone2].context[<[start]>|<[end]>|<[angle]>|<[between]>]>
    - narrate <[layers].size>
    - foreach <[layers]> as:layer:
      - playeffect <[particle]> at:<[layer]> quantity:5 offset:0 visibility:100
      - wait 1t
