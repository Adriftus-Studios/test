storm_entity:
    type: entity
    entity_type: drowned
    mechanisms:
        custom_name: <aqua>Myrskyn Kokonaisuus
        custom_name_visible: false
        speed: 0.23
        age: baby
        equipment:
            helmet: blue_stained_glass
            chestplate: <proc[random_basic_chestplate]>
            leggings: <proc[random_basic_leggings]>
            boots: <proc[random_basic_boots]>
        item_in_hand: <proc[random_basic_tool]>
        item_in_offhand: <proc[random_basic_tool]>
        potion_effects:
            - <map[type=INVISIBILITY;amplifier=0;duration=1639s;ambient=false;particles=false;icon=false]>

storm_entity_events:
    type: world
    debug: false
    events:
        on storm_entity dies:
            - definemap loot:
                storm_shard: 0.1
                air: 35
            - determine <item[<[loot].proc[get_weighted_response_from_map]>]>
        on entity damaged by storm_entity:
            # make primary damage type lightning
            - determine passively <context.final_damage.div[3]>
            - strike <context.entity.location>
        after storm_entity added to world:
            - while <context.entity.exists>:
                # make them super aggressive for absolutely no reason
                - attack <context.entity> target:<context.entity.location.find_players_within[300].first>
                - wait 3s
