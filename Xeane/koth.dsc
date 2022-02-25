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
    - define winner <server.online_players.sort_by_number[flag[koth.current.points]].first>
    - announce <script[koth_config].parsed_key[messages.winner]>
    - run koth_start

koth_run_area:
  type: task
  debug: false
  script:
    - define location <server.flag[koth.global.koth_location].keys.random>
    - define location_name <server.flag[koth.global.koth_location.<[location]>.name]>
    - flag server koth.current.koth_location:<[location_name]>
    - define radius <script[koth_config].data_key[koth_radius]>
    - note <[location].as_location.to_ellipsoid[<[radius]>,<[radius]>,<[radius]>]> as:current_koth
    - announce <script[koth_config].data_key[messages.announce_location]>
    # 6,000t is 5 minutes
    - repeat 3000:
      - playeffect at:<ellipsoid[current_koth].shell> effect:dragon_breath quantity:1 targets:<world[orient].players>
      - flag <ellipsoid[current_koth].players> koth.current.points:++
      - flag <ellipsoid[current_koth].players> koth.global.points:++
      - wait 1t
      - flag server koth.current.leader:<server.online_players_flagged[koth.current].sort_by_number[flag[koth.current.points]].first>
      - wait 1s