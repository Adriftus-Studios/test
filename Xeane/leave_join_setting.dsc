network_leave_join_messages:
  type: world
  debug: false
  events:
    on player joins:
      - determine NONE
    on player quits:
      - determine passively NONE
      - if !<yaml[global.player.<player.uuid>].contains[settings.leave_task]>:
        - announce "<proc[get_player_display_name]> has left the Server."
      - else if <yaml[global.player.<player.uuid>].read[settings.leave_task]> != silent:
        - run <yaml[global.player.<player.uuid>].contains[settings.leave_task]>

    on custom event id:global_player_data_loaded:
      - if !<yaml[global.player.<player.uuid>].contains[settings.join_task]>:
        - announce "<proc[get_player_display_name]> has joined the Server."
      - else if <yaml[global.player.<player.uuid>].read[settings.join_task]> != silent:
        - run <yaml[global.player.<player.uuid>].contains[settings.join_task]>

network_join_hell:
  type: task
  debug: false
  script:
    - title title:<&c><&font[adriftus:overlay]><&chr[0001]><&chr[F801]><&chr[0001]> "subtitle:<&color[#880000]>Doom has come to this world" fade_in:10t stay:3s fade_out:10t targets:<server.online_players>