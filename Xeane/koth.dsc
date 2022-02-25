koth_config:
  type: data
  messages:
    warning_5: "<&a>Starting in 5 minutes"
    warning_1: "<&a>Starting in 1 minute"
    start: "<&b>Start"
    announce_location: "<&a>New KOTH Location <[location_name]>!"
    winner: "<[winner].name> has won!"
  # KOTH Area size
  koth_radius: 6

koth_events:
  type: world
  debug: false
  events:
    after server start:
      - run koth_start
    on player joins:
      - if !<player.has_flag[koth.current]>:
        - flag player koth.current.points:0
        - flag player koth.current.direction:<element[<&nbsp>]>
      - if !<player.has_flag[koth.global]>:
        - flag player koth.global.points:0
        - flag player koth.global.kills:0
        - flag player koth.global.deaths:0
    on player jumps flagged:koth_hop:
      - define location <player.location>
      - if <[location].pitch> < -25:
        - wait 1t
        - adjust <player> velocity:<[location].with_pitch[<[location].pitch.sub[5]>].direction.vector.mul[10]>
    on player dies in:orient bukkit_priority:MONITOR:
      - flag player koth.global.deaths:++
      - if <context.damager.exists>:
        - flag <context.damager> koth.global.kills:++
koth_start:
  type: task
  debug: false
  definitions: immediate
  script:
    - if !<server.has_flag[koth.current.leader]>:
      - flag server koth.current.leader.name:<&6>Awaiting...
      - flag server koth.current.leader.points:<&6>Awaiting...
    - announce <script[koth_config].data_key[messages.warning_5]>
    - wait 4m if:<[immediate].not||true>
    - announce <script[koth_config].parsed_key[messages.warning_1]>
    - wait 1m if:<[immediate].not||true>
    - flag <server.players_flagged[koth.current]> koth.current:!
    - announce <script[koth_config].parsed_key[messages.start]>
    - flag <world[orient].players> koth.current.points:0
    - run koth_update_directions
    - repeat 3:
      - ~run koth_run_area
    - note remove as:current_koth
    - define winner <server.online_players.sort_by_number[flag[koth.current.points]].last>
    - announce <script[koth_config].parsed_key[messages.winner]>
    - run koth_start

koth_run_area:
  type: task
  debug: false
  script:
    - define location <server.flag[koth.global.koth_location].keys.random>
    - define location_name <server.flag[koth.global.koth_location.<[location]>.name]>
    - flag server koth.current.koth_location:<[location_name]>
    - if <server.has_flag[koth.global.koth_location.<[location]>.beacon_glass]>:
      - modifyblock <server.has_flag[koth.global.koth_location.<[location]>.beacon_glass]> green_stained_glass
    - define radius <script[koth_config].data_key[koth_radius]>
    - note <[location].as_location.to_ellipsoid[<[radius]>,<[radius]>,<[radius]>]> as:current_koth
    - announce <script[koth_config].parsed_key[messages.announce_location]>
    # 6,000t is 5 minutes
    - define particles <ellipsoid[current_koth].shell.filter[material.name.equals[air]]>
    - repeat 6000:
      - if <[value].mod[20]> == 0:
        - playeffect at:<[particles]> effect:dragon_breath quantity:1 targets:<world[orient].players> offset:0.05
        - flag <ellipsoid[current_koth].players> koth.current.points:++
        - flag <ellipsoid[current_koth].players> koth.global.points:++
      - if !<server.online_players_flagged[koth.current].is_empty>:
        - define leader <server.online_players_flagged[koth.current].sort_by_number[flag[koth.current.points]].last>
        - flag server koth.current.leader.name:<[leader].display_name>
        - flag server koth.current.leader.points:<[leader].flag[koth.current.points]>
      - wait 1t

    - if <server.has_flag[koth.global.koth_location.<[location]>.beacon_glass]>:
      - modifyblock <server.has_flag[koth.global.koth_location.<[location]>.beacon_glass]> red_stained_glass

koth_enable_hop:
  type: task
  debug: false
  script:
    - define targets <world[orient].players.exclude[<cuboid[spawn].players>]>
    - foreach <[targets]>:
      - flag <[value]> koth_hop duration:10s
      - flag <[value]> no_fall_damage:10s
    - wait 10s
    - flag <[targets]> no_fall_damage_once duration:15s

koth_update_directions:
  type: task
  debug: false
  data:
    font_map:
      "-90": <&chr[6909]>
      "-45": <&chr[6910]>
      "0": <&chr[6911]>
      "45": <&chr[6912]>
      "90": <&chr[6913]>
      "135": <&chr[6914]>
      "180": <&chr[6915]>
      "225": <&chr[6916]>
      "270": <&chr[6909]>
  script:
    - wait 2t
    - while <ellipsoid[current_koth].exists>:
      - foreach <world[orient].players> as:target:
        - define yaw <[target].location.direction[<ellipsoid[current_koth].location>].yaw.sub[<[target].location.yaw>].round_to_precision[45]>
        - flag <[target]> koth.current.direction:<script.parsed_key[data.font_map.<[yaw]>]>
        - if <[loop_index].mod[10]> == 0:
          - wait 1t
      - wait 2t
