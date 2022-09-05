storm_event_events:
    type: world
    events:
        after delta time secondly every:5 server_flagged:events.active.storm:
        - foreach <server.worlds.filter_tag[<[filter_value].environment.equals[NORMAL]>]> as:w:
            - if <[w].weather.thundering.not>:
                - weather <[w]> thunder
