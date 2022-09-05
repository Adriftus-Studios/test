storm_entity:
    type: entity
    entity_type: drowned
    mechanisms:
        custom_name: <aqua>Storm Entity
        custom_name_visible: true
        speed: 0.28
        age: baby
        equipment:
            helmet: blue_stained_glass
            chestplate: <list[diamond|wooden|golden|netherite|stone|iron|chainmail].random>_chestplate
            leggings: <list[diamond|wooden|golden|netherite|stone|iron|chainmail].random>_leggings
            boots: <list[diamond|wooden|golden|netherite|stone|iron|chainmail].random>_boots
        item_in_hand: <list[diamond|wooden|golden|netherite|stone|iron].random>_<list[shovel|pickaxe|hoe|sword|axe].random>
        item_in_offhand: <list[diamond|wooden|golden|netherite|stone|iron].random>_<list[shovel|pickaxe|hoe|sword|axe].random>

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
