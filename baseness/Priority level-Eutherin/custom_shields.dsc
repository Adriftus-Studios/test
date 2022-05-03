iron_shield:
    type: item
    debug: false
    material: shield
    display name: <&f>Iron Shield
    lore:
        - Reinforced with the power of Iron
    mechanisms:
        custom_model_data: 694201
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
        max: 200
        current: 0
    mechanisms:
        custom_model_data: 694202
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
    flags:
      custom_durability:
        max: 200
        current: 0
    mechanisms:
        custom_model_data: 694203
    recipes:
        1:
            type: shaped
            input:
                - air|diamond|air
                - diamond|shield|diamond
                - air|diamond|air

diamond_shield_world:
    type: task
    debug: false
    events:
        on player equips diamond_shield:
            - while <player.has_equipped[diamond_shield]>:
                - adjust <player> walk_speed:0.9*<player.walk_speed>

netherite_shield:
    type: item
    debug: false
    material: shield
    display name: <&f>Netherite Shield
    lore:
        - Bathed in lava
    flags:
      custom_durability:
        max: 200
        current: 0
    mechanisms:
        custom_model_data: 694204
        attribute_modifiers:
                        generic_movement_speed:
                              1:
                                  operation: add_number
                                  amount: -0.01
                                  slot: off_hand
                              2:
                                  operation: add_number
                                  amount: -0.01
                                  slot: hand
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
      - if <player.item_in_hand.material.name> == shield:
        - define slot <player.held_item_slot>
      - if <player.item_in_offhand.material.name> == shield:
        - define slot 41
      - define value 1
      - inject custom_durability_process_task

