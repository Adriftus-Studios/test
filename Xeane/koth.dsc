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
      - if !<player.has_flag[koth.global]>:
        - flag player koth.global.points:0
        - flag player koth.global.kills:0
        - flag player koth.global.deaths:0
    on player jumps flagged:koth_hop:
      - define location <player.location>
      - if <[location].pitch> < -25 && <player.location.y> <= 35:
        - wait 1t
        - adjust <player> velocity:<[location].with_pitch[<[location].pitch.sub[5]>].direction.vector.mul[10]>
    on player dies in:orient bukkit_priority:MONITOR:
      - flag player koth.global.deaths:++
      - if <context.damager.exists>:
        - flag <context.damager> koth.global.kills:++
koth_start:
  type: task
  debug: false
  script:
    - announce <script[koth_config].data_key[messages.warning_5]>
    - flag <server.players_flagged[koth.current]> koth.current:!
    - wait 4m
    - announce <script[koth_config].data_key[messages.warning_1]>
    - wait 1m
    - announce <script[koth_config].data_key[messages.start]>
    - repeat 3:
      - run start_koth_area
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
    - announce <script[koth_config].data_key[messages.announce_location]>
    # 6,000t is 5 minutes
    - define particles <ellipsoid[current_koth].shell.filter[material.name.equals[air]]>
    - repeat 3000:
      - playeffect at:<[particles]> effect:dragon_breath quantity:1 targets:<world[orient].players> offset:0.05
      - flag <ellipsoid[current_koth].players> koth.current.points:++
      - flag <ellipsoid[current_koth].players> koth.global.points:++
      - wait 1t
      - flag server koth.current.leader:<server.online_players_flagged[koth.current].sort_by_number[flag[koth.current.points]].last>
      - wait 1s
    - if <server.has_flag[koth.global.koth_location.<[location]>.beacon_glass]>:
      - modifyblock <server.has_flag[koth.global.koth_location.<[location]>.beacon_glass]> red_stained_glass

koth_enable_hop:
  type: task
  debug: false
  script:
    - foreach <world[orient].players.exclude[<cuboid[spawn].players>]>:
      - flag <[value]> koth_hop duration:10s
      - flag <[value]> no_fall_damage:10s