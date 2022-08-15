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
      - define players_visible <[players_in_range].filter[can_see[<context.entity>]]>
      - wait 1t
      - cast darkness duration:30s <[players_visible]>
      - wait 1t
      - if <[last_location].exists> && <[last_location].distance[<context.entity.location>]> < 1 && <[players_visible].size> > 1:
        - repeat 20:
          - playeffect effect:redstone special_data:5|black quantity:20 offset:1,2,1 at:<context.entity.location.above>
          - wait 2t
          - stop if:<context.entity.is_spawned.not>
        - teleport <context.entity> <[players_visible].random.location.backward_flat[2]>
      - wait 1t
      - define targets <context.entity.location.find_spawnable_blocks_within[12]>
      - if <context.entity.is_spawned> && <[targets].size> > 1:
        - shoot falling_block[fallingblock_type=sculk_sensor;fallingblock_drop_item=false] destination:<[targets].random.center> origin:<context.entity.eye_location> save:block
      - wait 10s

warden_debug:
  type: task
  debug: false
  script:
    - announce target<&co><context.target>