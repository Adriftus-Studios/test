koth_config:
  type: data
  messages:
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
      - if !<server.worlds.parse[name].contains[orient]>:
        - createworld orient
        - wait 10s
      - run koth_start
      - run koth_spawn_launcher_particles
    on player joins:
      - if !<player.has_flag[koth.current]>:
        - flag player koth.current.points:0
        - flag player koth.current.direction:<&sp>
      - if !<player.has_flag[koth.global]>:
        - flag player koth.global.points:0
        - flag player koth.global.kills:0
        - flag player koth.global.deaths:0
        - flag player koth.global.wins:0
      - wait 5t
      - if <server.current_bossbars.contains[current_koth]>:
        - bossbar update current_koth players:<world[orient].players>
      - else if <server.current_bossbars.contains[countdown]>:
        - bossbar update countdown players:<world[orient].players>
    on player jumps flagged:koth_hop:
      - define location <player.location>
      - if <[location].pitch> < -25:
        - wait 1t
        - adjust <player> velocity:<[location].with_pitch[<[location].pitch.sub[5]>].direction.vector.mul[10]>
    on player dies in:orient bukkit_priority:MONITOR:
      - flag player koth.global.deaths:++
      - if <context.damager.exists>:
        - flag <context.damager> koth.global.kills:++
    on player respawns:
      - determine passively <world[orient].spawn_location>
      - flag <player> no_damage
      - worldborder reset <player>
    on player dies bukkit_priority:HIGHEST:
      - determine NO_DROPS
    on player enters koth_area:
      - flag <player> no_damage:!
      - flag <player> koth_hop:!
      - adjust <player> gliding:false if:<player.gliding>
      - flag <player> no_fall_damage_once duration:15s
    after player enters spawn_launcher:
      - inject koth_launcher
    after player exits spawn:
      - flag <player> koth_hop
      - if <ellipsoid[current_koth].exists>:
        - worldborder <world[orient].players> center:<ellipsoid[current_koth].location> size:50

koth_start:
  type: task
  debug: false
  definitions: immediate
  script:
    - while <world[orient].players.is_empty>:
      - wait 1s
    - if !<server.has_flag[koth.current.leader]>:
      - flag server koth.current.leader.name:<&6>Awaiting...
      - flag server koth.current.leader.points:<&6>Awaiting...
    - flag server koth.current.koth_location:<&6>Awaiting...
    - ~run koth_countdown if:<[immediate].not||true>
    - teleport <world[orient].players> <world[orient].spawn_location>
    - announce <script[koth_config].parsed_key[messages.start]>
    - flag <server.players_flagged[koth.current.points]> koth.current.points:0
    - run koth_update_directions
    - repeat 3:
      - ~run koth_run_area def:<[value]>
      - wait 1s
    - note remove as:current_koth
    - if <server.online_players_flagged[koth.current.points].size> > 0:
      - define winner <server.online_players_flagged[koth.current.points].sort_by_number[flag[koth.current.points]].last>
      - flag <[winner]> koth.global.wins:++
      - announce <script[koth_config].parsed_key[messages.winner]>
    - run koth_start

koth_countdown:
  type: task
  debug: false
  script:
    - flag <server.players_flagged[koth.current.direction]> koth.current.direction:<&sp>
    - bossbar create countdown "title:Countdown <duration[300s].formatted>" progress:1 color:green players:<world[orient].players>
    - repeat 300:
      - define color <list[green|yellow|red].get[<[value].div[100].round_up>]>
      - define color_symbol <list[<&a>|<&e>|<&c>].get[<[value].div[100].round_up>]>
      - define time <duration[300s].sub[<[value]>s].formatted>
      - bossbar update countdown "title:<[color_symbol]>Countdown <[time]>" progress:<element[300].sub[<[value]>].div[300]> color:<[color]>
      - wait 1s
    - bossbar remove countdown

koth_run_area:
  type: task
  debug: false
  definitions: round
  script:
    - define location_id <server.flag[koth.global.koth_location].keys.random>
    - define location <server.flag[koth.global.koth_location.<[location_id]>.location]>
    - define location_name <server.flag[koth.global.koth_location.<[location_id]>.name]>
    - flag server koth.current.koth_location:<[location_name]>
    - if <server.has_flag[koth.global.koth_location.<[location_id]>.beacon_glass]>:
      - modifyblock <server.flag[koth.global.koth_location.<[location_id]>.beacon_glass]> green_stained_glass
    - define radius <script[koth_config].data_key[koth_radius]>
    - note <[location].to_ellipsoid[<[radius]>,<[radius]>,<[radius]>]> as:current_koth
    - note <[location].sub[50,200,50].to_cuboid[<[location].add[50,200,50]>]> as:koth_area
    - worldborder <world[orient].players.filter[location.is_in[spawn]]> center:<[location]> size:50
    - announce <script[koth_config].parsed_key[messages.announce_location]>
    # 6,000t is 5 minutes
    - bossbar create current_koth title:<[location_name]> (<[round]>/3) progress:1 color:green players:<world[orient].players>
    - define particles <ellipsoid[current_koth].shell.filter[material.name.equals[air]]>
    - repeat 6000:
      - if <[value].mod[20]> == 0:
        - define color <list[green|yellow|red].get[<[value].div[2000].round_up>]>
        - bossbar update current_koth color:<[color]> progress:<element[300].sub[<[value].div[20].round>].div[300]>
        - playeffect at:<[particles]> effect:dragon_breath quantity:1 targets:<world[orient].players> offset:0.05
        - flag <ellipsoid[current_koth].players> koth.current.points:++
        - flag <ellipsoid[current_koth].players> koth.global.points:++
      - if !<server.online_players_flagged[koth.current].is_empty>:
        - define leader <server.online_players_flagged[koth.current.points].sort_by_number[flag[koth.current.points]].last>
        - flag server koth.current.leader.name:<[leader].display_name>
        - flag server koth.current.leader.points:<[leader].flag[koth.current.points]>
      - wait 1t
    - bossbar remove current_koth
    - note remove as:koth_area
    - worldborder <world[orient].players> reset
    - if <server.has_flag[koth.global.koth_location.<[location_id]>.beacon_glass]>:
      - modifyblock <server.has_flag[koth.global.koth_location.<[location_id]>.beacon_glass]> red_stained_glass

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
      "-360": <&chr[6911]>
      "-315": <&chr[6912]>
      "-270": <&chr[6913]>
      "-225": <&chr[6914]>
      "-180": <&chr[6915]>
      "-135": <&chr[6916]>
      "-90": <&chr[6909]>
      "-45": <&chr[6910]>
      "0": <&chr[6911]>
      "45": <&chr[6912]>
      "90": <&chr[6913]>
      "135": <&chr[6914]>
      "180": <&chr[6915]>
      "225": <&chr[6916]>
      "270": <&chr[6909]>
      "315": <&chr[6910]>
      "360": <&chr[6911]>
  script:
    - wait 2t
    - while <ellipsoid[current_koth].exists>:
      - foreach <world[orient].players> as:target:
        - if !<[target].is_online>:
          - foreach next
        - define yaw <[target].location.direction[<ellipsoid[current_koth].location>].yaw.sub[<[target].location.yaw>].round_to_precision[45]>
        - flag <[target]> koth.current.direction:<script.parsed_key[data.font_map.<[yaw]>]>
        - if <[loop_index].mod[10]> == 0:
          - wait 1t
      - wait 2t

koth_launcher:
  type: task
  debug: false
  script:
    - adjust <player> velocity:0,10,0
    - wait 1.5s
    - define chest <player.equipment_map.get[chest]||air>
    - fakeequip <player> chest:<[chest]> for:<server.online_players>
    - equip <player> chest:elytra
    - adjust <player> velocity:<player.location.direction.vector>
    - wait 1t
    - adjust <player> gliding:true
    - while <player.gliding>:
      - wait 1s
    - equip <player> chest:<[chest]>
    - fakeequip <player> reset

koth_spawn_launcher_particles:
  type: task
  debug: false
  script:
    - define blocks <cuboid[spawn_launcher].blocks.filter[y.is[less].than[266]].parse[center]>
    - while <cuboid[spawn_launcher].exists>:
      - playeffect at:<[blocks]> effect:dragon_breath quantity:1 offset:1 velocity:0,0.2,0 targets:<world[orient].players>
      - wait 2t