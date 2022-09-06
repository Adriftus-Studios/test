storm_entity:
    type: entity
    entity_type: drowned
    mechanisms:
        custom_name: <aqua>Storm Entity
        custom_name_visible: false
        speed: 0.23
        age: baby
        equipment:
            helmet: blue_stained_glass
            chestplate: <list[golden|iron|chainmail].random>_chestplate
            leggings: <list[golden|iron|chainmail].random>_leggings
            boots: <item[<list[golden|iron|chainmail].random>_boots].with_single[enchantments=<map[depth_strider=1000]>]>
        item_in_hand: <list[wooden|golden|stone|iron].random>_<list[shovel|pickaxe|hoe|sword|axe].random>
        item_in_offhand: <list[wooden|golden|stone|iron].random>_<list[shovel|pickaxe|hoe|sword|axe].random>
        potion_effects:
            - <map[type=INVISIBILITY;amplifier=0;duration=1639s;ambient=false;particles=false;icon=false]>

storm_entity_events:
    type: world
    debug: false
    events:
        on storm_entity dies:
            - determine NO_DROPS
        on entity damaged by storm_entity:
            - determine passively <context.final_damage.div[3]>
            - strike <context.entity.location>
        after storm_entity added to world:
            - while <context.entity.exists>:
                - attack <context.entity> target:<context.entity.location.find_players_within[300].first>
                - wait 3s
