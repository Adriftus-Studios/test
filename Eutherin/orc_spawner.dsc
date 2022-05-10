Orc_spawn_task:
  Type: world
  Debug: false
  Events:
    On delta time secondly every:10:
      ‐ if <server.online_players.size> != 0:
        - define count <server.online_players.size.div[5].round_up>,
        - define select_few <server.online_players.random[<[count]>]>
        - foreach <[select_few]> as:poor_soul:
          - choose <[poor_soul].location.biome>:
            - case *desert:
              - define type Orc
            - case default:
              - define type Orc
          - mythicspawn <[type]>PartyPlaceholder <[poor_soul].location.with_pose[0,<util.random.int[0].to[359]>].forward[20].find_spawnable_blocks_within[10]>
      
