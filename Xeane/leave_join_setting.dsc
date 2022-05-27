network_leave_join_messages:
  type: world
  debug: false
  events:
    on player joins:
      - determine NONE
    on player quits bukkit_priority:LOW:
      - determine passively NONE
      - if <yaml[global.player.<player.uuid>].contains[settings.leave_task]> && <script[network_leave_<yaml[global.player.<player.uuid>].read[settings.leave_task]>].exists>:
        - inject network_leave_<yaml[global.player.<player.uuid>].read[settings.leave_task]>
      - else if <server.has_flag[leave_message]>:
        - define message <server.flag[leave_message].parsed>
      - else:
        - define message "<player.name><&f> has left the Server."
      - announce <[message]>
      - bungeerun relay Player_Leave_Message def:<list[<bungee.server>|<player.name>|<player.uuid>].include[<[message].strip_color>]>

    on custom event id:global_player_data_loaded:
      - if <yaml[global.player.<player.uuid>].contains[settings.join_task]> && <script[network_join_<yaml[global.player.<player.uuid>].read[settings.join_task]>].exists>:
        - inject network_join_<yaml[global.player.<player.uuid>].read[settings.join_task]>
      - else if <server.has_flag[join_message]>:
        - define message <server.flag[join_message].parsed>
      - else:
        - define message "<player.name><&f> has joined the Server."
      - announce <[message]>
      - bungeerun relay Player_Join_Message def:<list[<bungee.server>|<player.name>|<player.uuid>].include[<[message].strip_color>]>

leave_join_command:
  type: command
  debug: false
  name: leavejoin
  description: leave/join control
  usage: /leavejoin (option)
  permission: adriftus.leavejoin
  data:
    maps:
      # root
      silent:
        settings:
          leave_task: silent
          join_task: silent

      none:
        settings:
          leave_task: !
          join_task: !

      hell:
        settings:
          leave_task: hell
          join_task: hell

      colors:
        settings:
          leave_task: colors
          join_task: colors

      message:
        settings:
          leave_task: custom_message
          join_task: custom_message
          custom_leave_message: <[leave]>
          custom_join_message: <[join]>

  tab completions:
    1: silent|task|message|none
  script:
    - if <context.args.size> < 1:
      - narrate "<&c>Not enough arguments"
      - stop
    - choose <context.args.get[1]>:
      - case silent:
        - run GLOBAL_PLAYER_DATA_MODIFY_MULTIPLE def:<player.uuid>|<script.data_key[data.maps.silent]>
      - case none:
        - run GLOBAL_PLAYER_DATA_MODIFY_MULTIPLE def:<player.uuid>|<script.data_key[data.maps.none]>
      - case task:
        - if <context.args.size> < 2:
          - narrate "<&c>Not Enough Arguments for TASK input."
          - stop
        - if !<script.data_key[data.maps.<context.args.get[2]>].exists>:
          - narrate "<&c>Unknown TASK input<&co> <context.args.get[2]>"
          - stop
        - run GLOBAL_PLAYER_DATA_MODIFY_MULTIPLE def:<player.uuid>|<script.data_key[data.maps.<context.args.get[2]>]>
      - case message:
        - if <context.args.size> < 3:
          - narrate "<&c>Not Enough Arguments for MESSAGE input."
          - stop
        - define leave <context.args.get[2]>
        - define join <context.args.get[3]>
        - run GLOBAL_PLAYER_DATA_MODIFY_MULTIPLE def:<player.uuid>|<script.data_key[data.maps.<context.args.get[1]>]>

network_join_silent:
  type: task
  debug: false
  script:
    - narrate "<&a>You have silently joined the server."

network_leave_silent:
  type: task
  debug: false
  script:
    - stop

network_join_custom_message:
  type: task
  debug: false
  script:
    - define message <yaml[global.player.<player.uuid>].read[settings.custom_join_message]>

network_leave_custom_message:
  type: task
  debug: false
  script:
    - define message <yaml[global.player.<player.uuid>].read[settings.custom_leave_message]>

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
