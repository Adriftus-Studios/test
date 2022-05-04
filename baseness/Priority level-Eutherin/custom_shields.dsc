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
        max: 50
        current: 0
    recipes:
        1:
            type: shaped
            input:
                - air|iron_ingot|air
                - iron_ingot|shield|iron_ingot
                - air|iron_ingot|air

iron_shield:
    type: item
    debug: false
    material: shield
    display name: <&f>Iron Shield
    lore:
        - Reinforced with the power of Iron
    mechanisms:
        custom_model_data: 1
    flags:
      custom_durability:
        max: 50
        current: 0
    recipes:
        1:
            type: shaped
            input:
                - air|iron_ingot|air
                - iron_ingot|shield|iron_ingot
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
        max: 50
        current: 0
    recipes:
        1:
            type: shaped
            input:
                - air|iron_ingot|air
                - iron_ingot|shield|iron_ingot
                - air|iron_ingot|air

gold_shield:
    type: item
    debug: false
    material: shield
    display name: <&f>Gold Shield
    lore:
        - Brimming with potential.
    flags:
      custom_durability:
        max: 50
        current: 0
    mechanisms:
        custom_model_data: 2
    recipes:
        1:
            type: shaped
            input:
                - air|gold_ingot|air
                - gold_ingot|shield|gold_ingot
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
    flags:
      custom_durability:
        max: 50
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
                - diamond|shield|diamond
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
    flags:
      custom_durability:
        max: 50
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
                - amethyst_ingot|shield|amethyst_ingot
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
    flags:
      custom_durability:
        max: 50
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
                - netherite_ingot|shield|netherite_ingot
                - air|netherite_ingot|air


netherite_shield_world:
    type: task
    debug: false
    events:
        after player equips netherite_shield:
            - flag server base_run_speed:<player.speed>
            - adjust <player> speed:0.8*<player.speed>

        after player unequips netherite_shield:
            - adjust <player> speed:<server.flag[base_run_speed]>
#

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
