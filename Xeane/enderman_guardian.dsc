enderman_guardian:
  type: entity
  entity_type: enderman
  mechanisms:
    custom_name: <&d>Ender Guardian
    custom_name_visible: true
    health_data: 1000/1000
    has_ai: false
  flags:
    on_damaged: enderman_guardian_damaged

enderman_guardian_minion:
  type: entity
  entity_type: enderman
  mechanisms:
    custom_name: <&d>Enderman
    custom_name_visible: true
    health_data: 50/50
  flags:
    on_damaged: enderman_guardian_minion_damaged

enderman_guardian_start:
  type: task
  debug: false
  definitions: location
  script:
    # Initial Calculations
    - repeat 9:
      - define loc_<[value]> <[location].with_pose[0,<[value].mul[40]>]>
      - define safety_dance_zone_<[value]> <proc[define_cone1].context[<[loc]>|<[loc].forward[15]>|20|1].parse[with_y[<[loc].y>]]>
      - wait 1s
    # Opening Animation


    # Start the Fight
    - define location <player.location> if:<[location].exists.not>
    - spawn enderman_guardian <[location]> save:boss
    - if <entry[boss].spawned_entity.exists>:
      - repeat 9:
        - flag <entry[boss].spawned_entity> safety_dance.<[value]>.location:<[loc_<[value]>]>
        - flag <entry[boss].spawned_entity> safety_dance.<[value]>.zone:<[safety_dance_zone_<[value]>]>
      - while <entry[boss].spawned_entity.is_spawned> && <entry[boss].spawned_entity.health_percentage> > 33:
        - flag <entry[boss].spawned_entity> phase:1
        - run enderman_guardian_phase_1 def:<entry[boss].spawned_entity>

enderman_guardian_phase_1:
  type: task
  debug: false
  definitions: boss
  script:
    - while <[boss].flag[phase]> == 1:
      # Initialize Definitions
      - define spawnable_blocks <[boss].location.find_spawnable_blocks_within[15]>
      - define all_players <[boss].location.find_players_within[100]>
      - define targets <[boss].location.find_players_within[6]>
      # Knockback Explosion
      - repeat 120:
        - playeffect effect:DRAGON_BREATH at:<[boss].location.above[1.5]> offset:<[value].div[100]> quantity:<[value].div[10]> targets:<[all_players]>
        - wait 1t if:<[value].mod[10].equals[0]>
      - foreach <[targets]> as:target:
        - adjust <[target]> velocity:<[target].location.sub[<[boss].location>].normalize.mul[5].with_y[1]>
        - hurt 5
      # Spawn Adds
      - repeat 5:
        - repeat 5:
          - run enderman_guardian_spawn_enderman def:<[boss]>|<[spawnable_blocks].random>
          - wait 1s
        - wait 10s
      - flag <[boss]> phase:2
      - run enderman_guardian_phase_2 def:<[boss]>

enderman_guardian_spawn_enderman:
  type: task
  debug: false
  definitions: caster|destination
  script:
    # Definitions
    - define all_players <[caster].location.find_players_within[100]>
    - define start <[caster].eye_location.below.forward[0.5]>
    - define points <proc[define_curve1].context[<[start]>|<[destination]>|5|90|0.5]>

    # Play Arc Animation
    - foreach <[points]> as:point:
      - playeffect effect:DRAGON_BREATH at:<[point]> quantity:10 offset:0.1 targets:<[all_players]>
      - wait 1t if:<[loop_index].mod[2].equals[0]>

    # Spawn Animation
    - repeat 5:
      - playeffect effect:DRAGON_BREATH at:<[destination].above[1]> quantity:50 offset:0.2,1,0.2 targets:<[all_players]>

    # Spawn the Mob
    - spawn enderman_guardian_minion <[destination]> target:<[all_players].sort_by_number[distance[<[destination]>]].first> save:minion
    - wait 10s
    - if <entry[minion].spawned_entity.is_spawned>:
      - run enderman_guardian_minion_expire def:<entry[minion].spawned_entity>
    # Minion Flags
    ##TODO

enderman_guardian_phase_2:
  type: task
  debug: false
  definitions: boss
  script:
    # Definitions
    - define all_players <[boss].location.find_players_within[100]>

    # Safety Dance
    - repeat 15:
      - define number <util.random.int[1].to[9]>
      - teleport <[boss]> <[boss].flag[safety_dance.<[number]>.location]>
      - wait 2s
      - playeffect effect:DRAGON_BREATH at:<[boss].flag[safety_dance.<[number]>.zone]> quantity:1 velocity:0,0.2,0 targets:<[all_players]>
      - hurt <[all_players].filter_tag[<[boss].location.facing[<[filter_value].location>].degrees[20]>]>
      - wait 2s

# Entity Task Scripts
enderman_guardian_damaged:
  type: task
  debug: false
  script:
    - narrate oof

enderman_guardian_minion_damaged:
  type: task
  debug: false
  script:
    - narrate oof

enderman_guardian_minion_expire:
  type: task
  debug: false
  definitions: entity
  script:
    - remove <[entity]>
    - narrate oof
