storm_event_events:
    type: world
    events:
        after delta time secondly every:3 server_flagged:events.active.storm:
        - foreach <server.worlds.filter_tag[<[filter_value].environment.equals[NORMAL]>]> as:w:
            - if <[w].thundering.not>:
                - weather <[w]> thunder
        - foreach <server.online_players> as:p:
            - foreach next if:<[p].location.world.thundering.not>
            - repeat <util.random.int[1].to[5]>:
                - if <util.random_chance[15]>:
                    - if <[p].location.find_blocks[lightning_rod].within[35].any>:
                        - strike <[p].location.find_blocks[lightning_rod].within[35].random>
                    - else:
                        - strike <[p].location.chunk.surface_blocks.random>
