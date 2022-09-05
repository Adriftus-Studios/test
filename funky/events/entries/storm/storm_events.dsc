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
                        - define t <[p].location.find_blocks[lightning_rod].within[35].random>
                    - else:
                        - define t <[p].location.chunk.surface_blocks.random>
                    - strike <[t]> silent
                    - playsound <[t]> sound:entity_generic_explode volume:0.8 pitch:2.0
        on entity damaged server_flagged:events.active.storm:
            - define c <context.cause>
            - define d <context.final_damage>
            - stop if:<[c].exists.not>
            - if <[c]> in FIRE|FIRE_TICK|HOT_FLOOR|LAVA:
                - determine <[d].div[3]>
            - else if <[c]> in DRYOUT:
                - determine <[d].div[5]>
            - else if <[c]> in FREEZE|LIGHTNING|DRAGON_BREATH:
                - determine <[d].mul[1.5]>
            - else if <[c]> in MELTING:
                - determine <[d].mul[100]>
