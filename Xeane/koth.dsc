koth_config:
  type: data
  messages:
    warning_5: "<&a>Starting in 5 minutes"
    warning_1: "<&a>Starting in 1 minute"
    start: "<&b>Start"
    announce_location: "<&a>New KOTH Location <[location_name]>!"
  # KOTH Area size
  koth_radius: 6

koth_events:
  type: world
  debug: false
  events:
    after server start:
      - run koth_start
    


koth_start:
  type: task
  debug: false
  script:
    - announce <script[koth_config].data_key[messages.warning_5]>
    - wait 4m
    - announce <script[koth_config].data_key[messages.warning_1]>
    - wait 1m
    - announce <script[koth_config].data_key[messages.start]>
    - run start_koth_area

run_koth_area:
  type: task
  debug: false
  script:
    - define location <location[<server.flag[koth.global.koth_location].keys.random>]>
    - define radius <script[koth_config].data_key[koth_radius]>
    - note <[location].to_ellipsoid[<[radius]>,<[radius]>,<[radius]>]> as:current_koth
    - announce <script[koth_config].data_key[messages.announce_location]>
    # 6,000t is 5 minutes
    - repeat 3000:
      - playeffect at:current_koth effect:dragon_breath quantity:1 targets:<server.online_players>
      - flag <ellipsoid[current_koth].players> koth.current.points:++
      - flag <ellipsoid[current_koth].players> koth.global.points:++
      - wait 1s