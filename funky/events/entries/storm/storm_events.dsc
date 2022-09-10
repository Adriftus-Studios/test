storm_event_events:
    type: world
    events:
        after delta time secondly every:3 server_flagged:events.active.storm:
            - foreach <server.worlds.filter_tag[<[filter_value].environment.equals[NORMAL]>]> as:w:
                - if <[w].thundering.not>:
                    - weather <[w]> thunder
            - foreach <server.online_players> as:p:
                - foreach next if:<[p].location.world.thundering.not>
                - repeat <util.random.int[1].to[4]>:
                    - if <util.random_chance[10]>:
                        - if <[p].location.find_blocks[lightning_rod].within[35].any>:
                            - define t <[p].location.find_blocks[lightning_rod].within[35].random>
                        - else:
                            - define t <[p].location.chunk.surface_blocks.random>
                        - strike <[t]> silent
                        - playsound <[t]> sound:entity_generic_explode volume:0.5
                        - spawn storm_entity <[t].up[1]> target:<[p]> if:<util.random_chance[15]>
                - if <[p].location.light.sky> == 15 && <util.random_chance[25]>:
                    - cast slow <[p]> amplifier:2 duration:<util.random.int[3].to[10]>
                    - playsound <[p].location> sound:item_bucket_empty pitch:2.0 volume:2.0 sound_category:WEATHER
                    - if <[p].has_flag[events.data.storm.rain_warning_cooldown].not>:
                        - narrate "<blue><bold>You feel as if the rain itself is pulling you down..." targets:<[p]>
                        - flag <[p]> events.data.storm.rain_warning_cooldown expire:10m
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
        on entity combusts server_flagged:events.active.storm:
            - determine cancelled if:<context.entity.entity_type.equals[PLAYER].not>
        after zombie|skeleton spawns server_flagged:events.active.storm:
            - adjust <context.entity> item_in_hand:trident
            - adjust <context.entity> item_in_offhand:trident
        after creeper spawns server_flagged:events.active.storm:
            - adjust <context.entity> powered:true
        on player breaks dirt|coarse_dirt|grass_block server_flagged:events.active.storm:
            - stop if:<context.item.enchantment_types.contains[SILK_TOUCH]>
            - determine <list_single[<item[mud]>]>
