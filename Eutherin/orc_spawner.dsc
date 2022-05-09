Orc_spawn_task:
  Type: task
  Debug: false
  Events:
    On delta time every:15:
      ‐ if <server.online_players.size> != 0:
      - define count <server.online_players.size.div[5].round_up>,
      - define select_few <server.online_players.random[<[count]>]>
      - foreach <[select_few]> as:poor_soul:
        - mythicspawn OrcPartyPlaceholder <[poor_soul].location>
      
