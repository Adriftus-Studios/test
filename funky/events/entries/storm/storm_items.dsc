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
