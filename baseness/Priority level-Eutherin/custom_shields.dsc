copper_shield:
    type: item
    debug: false
    material: shield
    display name: <&f>Copper Shield
    lore:
        - Trimmed with Copper
    mechanisms:
        custom_model_data: 3
    flags:
      custom_durability:
        max: 200
        current: 0
    data:
      recipe_book_category: shields.2copper
    recipes:
        1:
            type: shaped
            input:
                - air|iron_ingot|air
                - iron_ingot|wooden_shield|iron_ingot
                - air|iron_ingot|air

wooden_shield:
    type: item
    debug: false
    material: shield
    display name: <&f>Wooden Shield
    lore:
        - Might as well use an old board.
    data:
      recipe_book_category: shields.1wooden
    flags:
      custom_durability:
        max: 20
        current: 0
    recipes:
        1:
            type: shaped
            input:
                - dark_oak_planks|iron_ingot|dark_oak_planks
                - dark_oak_planks|dark_oak_planks|dark_oak_planks
                - air|dark_oak_planks|air


iron_shield:
    type: item
    debug: false
    material: shield
    display name: <&f>Iron Shield
    lore:
        - Reinforced with the power of Iron
    mechanisms:
        custom_model_data: 1
    data:
      recipe_book_category: shields.3iron
    flags:
      custom_durability:
        max: 250
        current: 0
    recipes:
        1:
            type: shaped
            input:
                - air|iron_ingot|air
                - iron_ingot|wooden_shield|iron_ingot
                - air|iron_ingot|air

steel_shield:
    type: item
    debug: false
    material: shield
    display name: <&f>Steel Shield
    lore:
        - Infused with the strength of Steel
    mechanisms:
        custom_model_data: 7
    flags:
      custom_durability:
        max: 469
        current: 0
    data:
      recipe_book_category: shields.4steel
    recipes:
        1:
            type: shaped
            input:
                - air|iron_ingot|air
                - iron_ingot|wooden_shield|iron_ingot
                - air|iron_ingot|air

gold_shield:
    type: item
    debug: false
    material: shield
    display name: <&f>Gold Shield
    lore:
        - Brimming with potential.
    data:
      recipe_book_category: shields.5gold
    flags:
      custom_durability:
        max: 100
        current: 0
    mechanisms:
        custom_model_data: 2
    recipes:
        1:
            type: shaped
            input:
                - air|gold_ingot|air
                - gold_ingot|wooden_shield|gold_ingot
                - air|gold_ingot|air

diamond_shield:
    type: item
    debug: false
    material: shield
    display name: <&f>Diamond Shield
    lore:
        - Hard as can be
        - <empty>
        - Reduces movespeed by 7<&pc>
        - Reduces damage taken by 5<&pc>
    data:
      recipe_book_category: shields.7diamond
    flags:
      custom_durability:
        max: 1000
        current: 0
    mechanisms:
        custom_model_data: 4
        attribute_modifiers:
                        generic_movement_speed:
                              1:
                                  operation: add_number
                                  amount: -0.015
                                  slot: off_hand
                              2:
                                  operation: add_number
                                  amount: -0.015
                                  slot: hand
        hides: attributes
    recipes:
        1:
            type: shaped
            input:
                - air|diamond|air
                - diamond|wooden_shield|diamond
                - air|diamond|air

amethyst_shield:
    type: item
    debug: false
    material: shield
    display name: <&f>Amethyst Shield
    lore:
        - Perhaps too brittle
        - <empty>
        - Reduces movespeed by 7<&pc>
        - Reduces damage taken by 5<&pc>
    data:
      recipe_book_category: shields.6amethyst
    flags:
      custom_durability:
        max: 700
        current: 0
    mechanisms:
        custom_model_data: 5
        attribute_modifiers:
                        generic_movement_speed:
                              1:
                                  operation: add_number
                                  amount: -0.015
                                  slot: off_hand
                              2:
                                  operation: add_number
                                  amount: -0.015
                                  slot: hand
        hides: attributes
    recipes:
        1:
            type: shaped
            input:
                - air|amethyst_ingot|air
                - amethyst_ingot|wooden_shield|amethyst_ingot
                - air|amethyst_ingot|air

netherite_shield:
    type: item
    debug: false
    material: shield
    display name: <&f>Netherite Shield
    lore:
        - Bathed in lava
        - <empty>
        - Reduces movespeed by 15<&pc>
        - Reduces damage taken by 10<&pc>
    data:
      recipe_book_category: shields.8netherite
    flags:
      custom_durability:
        max: 1500
        current: 0
    mechanisms:
        custom_model_data: 6
        attribute_modifiers:
                        generic_movement_speed:
                              1:
                                  operation: add_number
                                  amount: -0.03
                                  slot: off_hand
                              2:
                                  operation: add_number
                                  amount: -0.03
                                  slot: hand
        hides: attributes
    recipes:
        1:
            type: shaped
            input:
                - air|netherite_ingot|air
                - netherite_ingot|wooden_shield|netherite_ingot
                - air|netherite_ingot|air

shield_durability_handler:
  Type: world
  Debug: false
  Events:
    On player damaged by entity:
      - if !<player.is_blocking>:
        - stop
      - define value <context.damage.round_up>
      - if <context.damage> <= 3:
        - define value <context.damage.round_down.add[1]>
      - if <player.item_in_hand.material.name> == shield:
        - define slot <player.held_item_slot>
        - inject custom_durability_process_task
        - stop
      - if <player.item_in_offhand.material.name> == shield:
        - define slot 41
        - inject custom_durability_process_task

gold_shield_enchant_handler:
  debug: false
  type: world
  events:
    on gold_shield enchanted:
      ##Defines the enchantment map, without this then the definition later on will error out.
      - define enchantment_map <map>
      - foreach <context.enchants> as:enchant_level key:enchant_applied:
        ##Boosts the proc rate by 0.1% a level, up to 10% at max level, seems low, but its PER enchantment on the item.
        - define proc_rate <util.random.int[0].to[100]>
        - if <[proc_rate]> > 80:
          ##retrieves the enchantment level and adds one to it
          - define enchant_level <[enchant_level].add[1]>
          ##defines the enchantment map while adding the current enchantment to it.
          - define enchantment_map <[enchantment_map].with[<[enchant_applied]>].as[<[enchant_level]>]>
          ##plays an visual and audio effect so the player knows it triggered.
          ##this is per effect, so if it triggers 4 times, it will be a particle explosion.
          - playeffect <context.location.add[1,1,1].to_cuboid[<context.location.sub[1,1,1]>].blocks> effect:dragon_breath quantity:5
          - playeffect <context.location.add[1,1,1].to_cuboid[<context.location.sub[1,1,1]>].blocks> effect:redstone quantity:5 special_data:3|250,0,250
          - playsound BLOCK_BELL_RESONATE <context.location>
        - else:
          ##if the proc didnt trigger, then it just adds the natural level of the enchantment
          - define enchantment_map <[enchantment_map].with[<[enchant_applied]>].as[<[enchant_level]>]>
      ##applies the enchantment map
      - determine enchants:<[enchantment_map]>

shield_replacer:
  type: world
  debug: false
  events:
    on player crafts shield:
      - determine wooden_shield
