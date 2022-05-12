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
    - while <player.has_flag[dwisp.active]>:
      - choose <player.flag[dwisp.active.task]>:
        - case idle:
          - while <player.flag[dwisp.active.task]> == idle:
            - if !<player.has_flag[dwisp.active.path]>:
              - flag <player> dwisp.active.path:<proc[define_curve1].context[<player.flag[dwisp.active.location]>|<player.location.above[2].random_offset[1,0.5,1]>|2|<util.random.int[-20].to[20]>|0.1]>
            - define targets <player.location.find_players_within[100]>
            - foreach <player.flag[dwisp.active.path]> as:point:
              - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:1.25|<player.flag[dwisp.data.color1]> targets:<[targets]>
              - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:1.25|<player.flag[dwisp.data.color2]> targets:<[targets]>
              - flag <player> dwisp.active.location:<[point]>
              - wait 2t
        - case spawn:
          - flag <player> dwisp.active.location:<player.eye_location>
          - define targets <player.location.find_players_within[100]>
          - repeat 20:
            - playeffect effect:redstone at:<player.flag[dwisp.active.location].above[0.1]> offset:0.1 quantity:5 special_data:1.25|<player.flag[dwisp.data.color1]> targets:<[targets]>
            - playeffect effect:redstone at:<player.flag[dwisp.active.location].above[0.1]> offset:0.1 quantity:5 special_data:1.25|<player.flag[dwisp.data.color2]> targets:<[targets]>
            - flag <player> dwisp.active.location:<player.flag[dwisp.active.location].above[0.1]>
            - wait 2t
          - flag <player> dwisp.active.task:idle if:<player.has_flag[dwisp.active.task].not>
        - case sleep:
          - define targets <player.location.find_players_within[100]>
          - flag <player> dwisp.active.path:<proc[define_curve1].context[<player.flag[dwisp.active.location]>|<player.eye_location.above[2]>|2|90|0.1]>
          - foreach <player.flag[dwisp.active.path]> as:point:
            - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:1.25|<player.flag[dwisp.data.color1]> targets:<[targets]>
            - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:1.25|<player.flag[dwisp.data.color2]> targets:<[targets]>
            - wait 2t
          - repeat 20:
            - playeffect effect:redstone at:<player.flag[dwisp.active.location].below[0.1]> offset:0.1 quantity:5 special_data:1.25|<player.flag[dwisp.data.color1]> targets:<[targets]>
            - playeffect effect:redstone at:<player.flag[dwisp.active.location].below[0.1]> offset:0.1 quantity:5 special_data:1.25|<player.flag[dwisp.data.color2]> targets:<[targets]>
            - flag <player> dwisp.active.location:<player.flag[dwisp.active.location].below[0.1]>
            - wait 2t
          - flag <player> dwisp.active:!