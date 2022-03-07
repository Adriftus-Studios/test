Decorator_Tool_Config:
  type: data
  Config:
    # No message by default. Change to true to warn players when they attempt
    # to interact with decorative blocks.
    do_message: false
    cooldown: 1s
    message: <dark_red>You cannot use this decorative <context.location.material.translated_name>.
    entity_mode: 1/rotate|2/move_x|3/move_z|4/move_y|5/base_plate|6/arms|7/size|8/invisibility
    misc_blocks:
    - loom
    - crafting_table
    - cartography_table
    - anvil
    - chipped_anvil
    - damaged_anvil
    - enchanting_table
    - grindstone
    - smithing_table
    - stonecutter
    - fletching_table
    - light_weighted_pressure_plate
    - heavy_weighted_pressure_plate
    - jukebox
    - daylight_detector
    - bell
    - cauldron
    - ender_chest
    - end_portal_frame
    - composter
    - campfire
    - flower_pot
    - beacon
    - command_block
    - cake
    #- painting
    #- item_frame
    #- armor_stand

Decorator_Tool_Item:
  type: item
  material: stick
  display name: <blue>Decorator Tool
  lore:
  - Right-click to mark location as decorative.
  - Left-click to unmark location.
  - Shift-right-click to toggle block state.

Decorator_Tool_Command:
  type: command
  name: decorate
  usage: /decorate
  permission: beruscripts.decorator
  description: Gives the player a Decorator Tool.
  script:
      - if !<player.inventory.contains_item[decorator_tool_item]>:
        - give decorator_tool_item
        - narrate "<aqua>You received a <blue>[Decorator Tool]<aqua>."
        - narrate "<gray>Right-click to decorate, left-click to un-decorate."
        - narrate "<gray>Right-click while sneaking to toggle open/closed."
      - else:
        - take scriptname:decorator_tool_item
        - narrate "<red>Removed your <blue>[Decorator Tool]<red>."

Decorator_Tool_Decorative_Blocks:
  type: world
  debug: true
  events:
    on player right clicks block location_flagged:decorator_tool_decorative priority:1:
      - determine passively cancelled
      - if <script[Decorator_Tool_Config].data_key[Config.do_message]> && !<player.has_flag[decorative_block_warn]>:
        - narrate <script[Decorator_Tool_Config].data_key[Config.message].parsed>
        - flag <player> decorative_block_warn duration:<script[Decorator_Tool_Config].data_key[Config.cooldown]>
    on player stands on material location_flagged:decorator_tool_decorative:
        - determine cancelled
    # Decorator tool functionality.
    on player clicks block with:decorator_tool_item priority:0:
      - determine passively cancelled
      - if <player.is_sneaking> && <context.click_type> == right_click_block:
        - if <context.location.material.supports[switched]>:
          - switch <context.location>
        - stop
      - choose <context.click_type>:
        - case right_click_block:
          - if <context.location.material.name> == player_head:
            - spawn armor_stand[gravity=false;invulnerable=true;collidable=false;armor_pose=head|0,0,0;equipment=air|air|air|<item[player_head].with[skull_skin=<context.location.skull_skin.full>]>] <context.location.center.with_facing_direction[<context.location.direction>].below[1.94]> save:decorative_head
            - flag <entry[decorative_head].spawned_entity> decorative
            - modifyblock <context.location> air
            - stop
          - else if !<context.location.material.supports[switched]> && !<context.location.has_inventory> && !<script[Decorator_Tool_Config].data_key[Config.misc_blocks].contains[<context.location.material.name>]> && !<context.location.material.name.ends_with[_bed]>:
            - narrate "<dark_gray>You cannot make <context.location.material.item.formatted> decorative."
            - stop
          - if <context.location.has_flag[decorator_tool_decorative]>:
            - narrate "<dark_gray>This <gray><context.location.material.translated_name> <dark_gray>is already decorative!"
            - stop
          - narrate "<aqua>Made this <gray><context.location.material.translated_name> <aqua>decorative."
          - flag <context.location> decorator_tool_decorative
          - if <context.location.other_block.exists>:
            - narrate "<aqua>(Also added adjacent block.)"
            - flag <context.location.other_block> decorator_tool_decorative
        - case left_click_block:
          - if !<context.location.has_flag[decorator_tool_decorative]>:
            - narrate "<dark_gray>This <gray><context.location.material.translated_name> <dark_gray>is not decorative!"
            - stop
          - narrate "<red>This <gray><context.location.material.translated_name> <red>is no longer decorative."
          - flag <context.location> decorator_tool_decorative:!
          - if <context.location.other_block.exists>:
            - narrate "<red>(Also removed adjacent block.)"
            - flag <context.location.other_block> decorator_tool_decorative:!
    # Item protection. (Prevents decorator tool from being transfered to another inventory.)
    on player drops decorator_tool_item:
      - determine passively cancelled
      - wait 1t
      - take scriptname:decorator_tool_item
    on player clicks in inventory with:decorator_tool_item:
      - if <context.clicked_inventory.inventory_type> != PLAYER:
        - determine passively cancelled
        - wait 1t
        - inventory update
    on player clicks decorator_tool_item in inventory:
      - if <context.is_shift_click> && <context.inventory.inventory_type> != PLAYER:
        - determine passively cancelled
        - wait 1t
        - inventory update
    on player drags decorator_tool_item in inventory:
      - if <context.clicked_inventory.inventory_type> != PLAYER:
        - determine passively cancelled
        - wait 1t
        - inventory update
    # If any player breaks a decorative block, alerts them and removes decoration flag.
    on player breaks block location_flagged:decorator_tool_decorative:
      - narrate "<red>You broke a decorative <context.location.material.translated_name.to_lowercase>."
      - flag <context.location> decorator_tool_decorative:!
      - if <context.location.other_block.exists>:
        - narrate "<red>(Also removed adjacent block.)"
        - flag <context.location.other_block> decorator_tool_decorative:!
        - modifyblock <context.location.other_block> air

Decorator_Tool_Armor_Stands:
  type: world
  debug: false
  events:
    on armor_stand damaged priority:1:
      - if <context.entity.has_flag[decorator_tool_decorative]>:
        - determine passively cancelled
    on armor_stand damaged by player with:decorator_tool_item:
      - determine passively cancelled
      - if !<context.entity.has_flag[decorator_tool_decorative]>:
        - flag <context.entity> decorator_tool_decorative
        - adjust <context.entity> gravity:false
        - adjust <context.entity> invulnerable:true
        - adjust <context.entity> collidable:false
        - adjust <context.entity> armor_pose:head|0,0,0
        - narrate "<aqua>Made this <gray>Armor Stand <aqua>decorative. <dark_gray>(Shift-left-click to destroy.)"
        - stop
      - if <player.is_sneaking>:
        - if <player.flag[decorator_tool_delete_entity]||null> == <context.entity.uuid>:
          - flag <player> decorator_tool_delete_entity:!
          - remove <context.entity>
          - narrate <red>Removed!
        - else:
          - flag <player> decorator_tool_delete_entity:<context.entity.uuid>
          - adjust <context.entity> glowing:true
          - narrate "<dark_red>Destroy this armor stand? <dark_gray>(Shift-left-click again to confirm.)"
          - wait 3s
          - flag <player> decorator_tool_delete_entity:!
          - adjust <context.entity> glowing:false
      - else:
        - choose <player.flag[decorator_tool_armor_stand_mode]||1>:
          - case 1:
            - teleport <context.entity> <context.entity.location.with_yaw[<context.entity.location.yaw.sub[5]>]>
          - case 2:
            - teleport <context.entity> <context.entity.location.sub[0.02,0,0]>
          - case 3:
            - teleport <context.entity> <context.entity.location.sub[0,0,0.02]>
          - case 4:
            - teleport <context.entity> <context.entity.location.sub[0,0.02,0]>
          - case 5:
            - adjust <context.entity> base_plate:<context.entity.base_plate.not>
          - case 6:
            - adjust <context.entity> arms:<context.entity.arms.not>
          - case 7:
            - adjust <context.entity> is_small:<context.entity.is_small.not>
          - case 8:
            - adjust <context.entity> visible:<context.entity.visible.not>
    on player right clicks armor_stand with:decorator_tool_item:
      - determine passively cancelled
      - if !<context.entity.has_flag[decorator_tool_decorative]>:
        - flag <context.entity> decorator_tool_decorative
        - adjust <context.entity> gravity:false
        - adjust <context.entity> invulnerable:true
        - adjust <context.entity> collidable:false
        - adjust <context.entity> armor_pose:head|0,0,0
        - narrate "<aqua>Made this <gray>Armor Stand <aqua>decorative. <dark_gray>(Shift-left-click to destroy.)"
        - stop
      - if <player.is_sneaking>:
        - if <player.flag[decorator_tool_armor_stand_mode]> < 8:
          - flag <player> decorator_tool_armor_stand_mode:++
        - else:
          - flag <player> decorator_tool_armor_stand_mode:1
        - actionbar "<blue>[Decorator Tool]: <aqua>Armor Stand Mode - <script[Decorator_Tool_Config].data_key[Config.entity_mode].as_map.get[<player.flag[decorator_tool_armor_stand_mode]>].replace[_].with[ ].to_titlecase>"
      - else:
        - choose <player.flag[decorator_tool_armor_stand_mode]||1>:
          - case 1:
            - teleport <context.entity> <context.entity.location.with_yaw[<context.entity.location.yaw.add[5]>]>
          - case 2:
            - teleport <context.entity> <context.entity.location.add[0.02,0,0]>
          - case 3:
            - teleport <context.entity> <context.entity.location.add[0,0,0.02]>
          - case 4:
            - teleport <context.entity> <context.entity.location.add[0,0.02,0]>
          - case 5:
            - adjust <context.entity> base_plate:<context.entity.base_plate.not>
          - case 6:
            - adjust <context.entity> arms:<context.entity.arms.not>
          - case 7:
            - adjust <context.entity> is_small:<context.entity.is_small.not>
          - case 8:
            - adjust <context.entity> visible:<context.entity.visible.not>