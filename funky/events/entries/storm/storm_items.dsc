storm_shard:
    type: item
    material: prismarine_crystals
    display name: <bold><aqua>Sadekomponentti
    lore:
    - <gray>Edessäni lepää kristalli,
    - <gray>jota vain Jumala pelkää.
    enchantments:
        - UNBREAKING:1
    mechanisms:
        hides: all
        custom_model_data: 1

storm_summon:
    type: item
    material: prismarine_crystals
    display name: <bold><aqua>Myrskyjumalan Kristalli
    lore:
    - <element[Niin kuin sade ja lumi tulevat alas taivaasta, eivätkä palaa siihen kastelematta maata ja saattamalla sen kukoistamaan, niin että se tuottaa siementä kylväjälle ja leipää syöjälle.].split_lines_by_width[200].lines_to_colored_list.parse_tag[<gray><[parse_value]>].separated_by[<&nl>]>
    enchantments:
        - UNBREAKING:1
    mechanisms:
        hides: all
        custom_model_data: 2

trident_bow:
    type: item
    material: crossbow
    display name: <bold><aqua>Kolmihampainen Ase
    lore:
    - <element[Lahja ampiaisen pesän potkimiseen.].split_lines_by_width[200].lines_to_colored_list.parse_tag[<gray><[parse_value]>].separated_by[<&nl>]>
    mechanisms:
        custom_model_data: 69
        # change model data

trident_bow_projectile:
    type: entity
    entity_type: trident

trident_bow_events:
    type: world
    debug: false
    events:
        after player loads crossbow crossbow:trident_bow:
            - playsound <player.location> sound:block_enchantment_table_use pitch:0.5 volume:2.0
            - determine passively KEEP_ITEM
        on player shoots trident_bow:
            - playsound <player.location> sound:block_enchantment_table_use pitch:2.0 volume:2.0
            - determine passively <entity[trident_bow_projectile]>
        on player picks up trident_bow_projectile:
            - determine cancelled
        after trident_bow_projectile hits entity:
            - playsound <context.entity.location> sound:entity_elder_guardian_curse pitch:2.0 volume:2.0
            - cast SLOW_DIGGING <context.entity> amplifier:0 duration:10s
