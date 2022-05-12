dwisp_populate:
  type: world
  debug: false
  populate:
    - flag server givable_items:!
    - flag server givable_items:|:<server.scripts.filter[data.show_in_give].parse[name.to_uppercase]>
  events:
    on server start:
      

dwisp_run:
  type: task
  debug: false
  script:
    - if !<player.has_flag[dwisp.data.color1]> || !<player.has_flag[dwisp.data.color2]>:
      - narrate "<&c>You must configure your dWisp colors first"
      - stop
    - while <player.has_flag[dwisp.active]> && <player.is_online>:
      - choose <player.flag[dwisp.active.task]>:
        - case idle:
          - while <player.flag[dwisp.active.task]> == idle && <player.is_online>:
            - define points <proc[define_curve1].context[<player.flag[dwisp.active.location]>|<player.location.above[2].random_offset[1,0.5,1]>|2|<util.random.int[-20].to[20]>|<player.flag[dwisp.active.location].distance[<player.eye_location>].mul[0.1]>]>
            - define targets <player.location.find_players_within[100]>
            - foreach <[points]> as:point:
              - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.25|<player.flag[dwisp.data.color1]> targets:<[targets]>
              - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:1|<player.flag[dwisp.data.color2]> targets:<[targets]>
              - flag <player> dwisp.active.location:<[point]>
              - wait 2t
        - case far_idle:
          - while <player.flag[dwisp.active.task]> == far_idle && <player.is_online>:
            - define points <proc[define_curve1].context[<player.flag[dwisp.active.location]>|<player.location.above[2].random_offset[5,0.5,5]>|2|<util.random.int[-20].to[20]>|<player.flag[dwisp.active.location].distance[<player.eye_location>].mul[0.1]>]>
            - define targets <player.location.find_players_within[100]>
            - foreach <[points]> as:point:
              - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.25|<player.flag[dwisp.data.color1]> targets:<[targets]>
              - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:1|<player.flag[dwisp.data.color2]> targets:<[targets]>
              - flag <player> dwisp.active.location:<[point]>
              - wait 2t
        - case spawn:
          - flag <player> dwisp.active.location:<player.eye_location>
          - define targets <player.location.find_players_within[100]>
          - repeat 20:
            - playeffect effect:redstone at:<player.flag[dwisp.active.location]> offset:0.05 quantity:5 special_data:1.25|<player.flag[dwisp.data.color1]> targets:<[targets]>
            - playeffect effect:redstone at:<player.flag[dwisp.active.location]> offset:0.1 quantity:5 special_data:1|<player.flag[dwisp.data.color2]> targets:<[targets]>
            - flag <player> dwisp.active.location:<player.flag[dwisp.active.location].above[0.1]>
            - wait 2t
          - flag <player> dwisp.active.task:idle
        - case sleep:
          - define targets <player.location.find_players_within[100]>
          - flag <player> dwisp.active.path:<proc[define_curve1].context[<player.flag[dwisp.active.location]>|<player.eye_location.above[2]>|2|90|0.1]>
          - foreach <player.flag[dwisp.active.path]> as:point:
            - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.25|<player.flag[dwisp.data.color1]> targets:<[targets]>
            - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:1|<player.flag[dwisp.data.color2]> targets:<[targets]>
            - flag <player> dwisp.active.location:<[point]>
            - wait 2t
          - repeat 20:
            - playeffect effect:redstone at:<player.flag[dwisp.active.location].below[0.1]> offset:0.05 quantity:5 special_data:1.25|<player.flag[dwisp.data.color1]> targets:<[targets]>
            - playeffect effect:redstone at:<player.flag[dwisp.active.location].below[0.1]> offset:0.1 quantity:5 special_data:1|<player.flag[dwisp.data.color2]> targets:<[targets]>
            - flag <player> dwisp.active.location:<player.flag[dwisp.active.location].below[0.1]>
            - wait 2t
          - flag <player> dwisp.active:!
        - case guard:
          - while <player.flag[dwisp.active.task]> == guard && <player.is_online>:
            - define mob <player.location.find_entities[monster].within[30].random.if_null[none]>
            - if <[mob]> != none && <[mob].is_spawned>:
              - define points <proc[define_curve1].context[<player.flag[dwisp.active.location]>|<[mob].eye_location>|2|<util.random.int[-20].to[20]>|<player.flag[dwisp.active.location].distance[<[mob].eye_location>].mul[0.1]>]>
            - else:
              - define points <proc[define_curve1].context[<player.flag[dwisp.active.location]>|<player.location.above[2].random_offset[1,0.5,1]>|2|<util.random.int[-20].to[20]>|<player.flag[dwisp.active.location].distance[<player.eye_location>].mul[0.1]>]>
            - define targets <player.location.find_players_within[100]>
            - foreach <[points]> as:point:
              - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.25|<player.flag[dwisp.data.color1]> targets:<[targets]>
              - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:1|<player.flag[dwisp.data.color2]> targets:<[targets]>
              - flag <player> dwisp.active.location:<[point]>
              - wait 2t
            - if <[mob]> != none:
              - repeat 10:
                - playeffect effect:redstone at:<[mob].location.above> offset:0.25,0.75,0.25 quantity:20 special_data:5|<player.flag[dwisp.data.color1]> targets:<[targets]>
                - playeffect effect:redstone at:<[mob].location.above> offset:0.25,0.75,0.25 quantity:20 special_data:2|<player.flag[dwisp.data.color2]> targets:<[targets]>
                - wait 1t
              - kill <[mob]>
              - wait 2t