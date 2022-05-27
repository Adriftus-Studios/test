network_leave_join_messages:
  type: world
  debug: false
  events:
    on player joins:
      - determine NONE
    on player quits bukkit_priority:LOW:
      - determine passively NONE
      - if <yaml[global.player.<player.uuid>].contains[settings.leave_task]> && <script[network_leave_<yaml[global.player.<player.uuid>].read[settings.leave_task]>].exists>:
        - run network_leave_<yaml[global.player.<player.uuid>].read[settings.leave_task]>
        - stop
      - else if <yaml[global.player.<player.uuid>].contains[settings.leave_message]> && <script[network_leave_<yaml[global.player.<player.uuid>].read[settings.leave_message]>].exists>:
        - define message <yaml[global.player.<player.uuid>].read[settings.leave_message]>
      - else if <server.has_flag[leave_message]>:
        - define message <server.flag[leave_message].parsed>
      - else:
        - define message "<player.name><&f> has left the Server."
      - announce <[message]>
      - bungeerun relay Player_Leave_Message def:<list[<bungee.server>|<player.name>|<player.uuid>].include[<[message].strip_color>]>

    on custom event id:global_player_data_loaded:
      - if <yaml[global.player.<player.uuid>].contains[settings.join_task]> && <script[network_join_<yaml[global.player.<player.uuid>].read[settings.join_task]>].exists>:
        - run network_join_<yaml[global.player.<player.uuid>].read[settings.join_task]>
        - stop
      - else if <yaml[global.player.<player.uuid>].contains[settings.join_message]> && <script[network_join_<yaml[global.player.<player.uuid>].read[settings.join_message]>].exists>:
        - define message <yaml[global.player.<player.uuid>].read[settings.join_message]>
      - else if <server.has_flag[join_message]>:
        - define message <server.flag[join_message].parsed>
      - else:
        - define message "<player.name><&f> has joined the Server."
      - announce <[message]>
      - bungeerun relay Player_Join_Message def:<list[<bungee.server>|<player.name>|<player.uuid>].include[<[message].strip_color>]>

network_join_hell:
  type: task
  debug: false
  script:
    - title title:<&c><&font[adriftus:overlay]><&chr[0001]><&chr[F801]><&chr[0001]> "subtitle:<&color[#880000]>Doom has come to this world" fade_in:10t stay:3s fade_out:10t targets:<server.online_players>

network_leave_hell:
  type: task
  debug: false
  script:
    - title title:<&f><&font[adriftus:overlay]><&chr[0001]><&chr[F801]><&chr[0001]> "subtitle:The World feels a litte safer.." fade_in:10t stay:3s fade_out:10t targets:<server.online_players>

network_join_colors:
  type: task
  debug: false
  script:
    - repeat 16:
      - title title:<&color[<color[random].hex>]><&font[adriftus:overlay]><&chr[0001]><&chr[F801]><&chr[0001]> "subtitle:The world feels more vibrant!" fade_in:1t stay:6t fade_out:1t targets:<server.online_players>
      - wait 5t

network_leave_colors:
  type: task
  debug: false
  script:
    - title title:<&7><&font[adriftus:overlay]><&chr[0001]><&chr[F801]><&chr[0001]> "subtitle:The World is a little less colorful" fade_in:10t stay:3s fade_out:10t targets:<server.online_players>
