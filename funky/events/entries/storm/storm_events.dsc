storm_event_events:
    type: world
    events:
        after delta time secondly every:5 server_flagged:events.active.storm:
        - foreach <server.worlds.filter_tag[<[filter_value].environment.equals[NORMAL]>]> as:w:
            - if <[w].thundering.not>:
                - weather <[w]> thunder
        - foreach <server.online_players> as:p:
            - foreach next if:<[p].location.world.thundering.not>
            - if <util.random_chance[90]>:
                - strike <[p].location.chunk.surface_blocks.random>
