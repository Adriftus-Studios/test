warden_boss:
  type: entity
  debug: false
  entity_type: warden
  flags:
    on_spawn: warden_test
    on_target: warden_debug
  mechanisms:
    health_data: 1000/1000

warden_test:
  type: task
  debug: false
  script:
    - while <context.entity.is_spawned>:
      - define players_in_range <context.entity.location.find_players_within[30]>
      - define need_darkness <[players_in_range].filter[has_effect[darkness].not]>
      - wait 1t
      - cast darkness duration:60s <[need_darkness]>
      - wait 1t
      - if <[last_location].exists> && <[last_location].distance[<context.entity.location>]> < 1 && <[players_visible].size> > 1:
        - repeat 20:
          - playeffect effect:redstone special_data:5|black quantity:20 offset:1,2,1 at:<context.entity.location.above>
          - wait 2t
          - stop if:<context.entity.is_spawned.not>
        - teleport <context.entity> <[players_visible].random.location.backward_flat[2]>
      - wait 1t
      - define target <context.entity.location.find_spawnable_blocks_within[20].random>
      - if <context.entity.is_spawned> && <[target].exists> && <[target].find_blocks[sculk_sensor].within[5].size> < 2:
        - define points <proc[define_curve1].context[<context.entity.eye_location>|<[target]>|90|3|1]>
        - foreach <[points]> as:point:
          - playeffect effect:redstone at:<[point]> offset:0.05 quantity:5 special_data:1.5|black targets:<[players_in_range]>
          - playeffect effect:redstone at:<[point]> offset:0.1 quantity:5 special_data:0.75|black targets:<[players_in_range]>
          - wait 2t
        - modifyblock <[target]> sculk_sensor
      - wait 10s

warden_debug:
  type: task
  debug: false
  script:
    - announce target<&co><context.target>