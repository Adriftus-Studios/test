fun_apparate:
  type: task
  definitions: destination
  debug: false
  script:
    - define gamemode <player.gamemode>
    - define targets <player.location.find_players_within[100]>
    - define starting_location <player.location>
    - define vector <[destination].sub[<player.location>].normalize.mul[30.1]>
    - define y <player.location.y.add[31].max[<[destination].y.add[31]>].max[<player.location.highest.y.add[14]>]>
    - define points <proc[define_curve1].context[<player.location>|<player.location.add[<[vector]>].with_y[<[y]>]>|5|90|1]>
    - define original_y <player.location.y>
    - repeat 10:
      - playeffect at:<player.location> offset:0.4 effect:redstone special_data:5|black quantity:30 targets:<[targets]>
      - wait 2t
    - adjust <player> gamemode:spectator
    - adjust <player> can_fly:true
    - define fly_speed <player.fly_speed>
    - adjust <player> fly_speed:0
    - repeat <[points].size.sub[1]>:
      - playeffect at:<player.location> offset:0.4 effect:redstone special_data:5|black quantity:30 targets:<[targets]>
      - adjust <player> velocity:<[points].get[<[value].add[1]>].sub[<[points].get[<[value]>]>]>
      - wait 2t
    - define new_vector <[destination].with_y[<player.location.y>].sub[<player.location>].normalize>
    - while <player.location.distance[<[destination].with_y[<[y]>]>]> > 41:
      - define new_targets <player.location.find_players_within[100]>
      - repeat 10:
        - adjust <player> velocity:<[new_vector]>
        - playeffect at:<player.location> offset:0.4 effect:redstone special_data:5|black quantity:30 targets:<[new_targets]>
        - wait 2t
    - define targets <player.location.find_players_within[100]>
    - define vector <[destination].sub[<player.location>].with_y[0].normalize.mul[3]>
    - define points <proc[define_curve1].context[<player.location>|<[destination].sub[<[vector]>]>|5|90|1]>
    - repeat <[points].size.sub[1]>:
      - playeffect at:<player.location> offset:0.4 effect:redstone special_data:5|black quantity:30 targets:<[targets]>
      - adjust <player> velocity:<[points].get[<[value].add[1]>].sub[<[points].get[<[value]>]>].normalize.div[1.6]>
      - wait 2t
    - adjust <player> gamemode:<[gamemode]>
    - adjust <player> fly_speed:<[fly_speed]>
    - adjust <player> can_fly:false
    - repeat 3:
      - playeffect at:<player.location> offset:<element[0.5].mul[<[value]>]> effect:redstone special_data:10|black quantity:<element[30].mul[<[value]>]> targets:<[targets]>
      - wait 1t