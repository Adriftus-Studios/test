# -- PvE Mission - Crafting
mission_craft:
  type: data
  id: craft
  category: PvE
  name: Craft Items
  description:
    - "Craft X items."
  assignment: mission_craft_assignment
  milestones:
    max: mission_craft_complete
  items:
    - oak_planks
    - spruce_planks
    - birch_planks
    - jungle_planks
    - acacia_planks
    - dark_oak_planks
    - coal_block
    - iron_block
    - gold_block
    - stone_bricks
  amounts:
    - 1
    - 5
    - 10
    - 12
    - 16

# Assignment Task
mission_craft_assignment:
  type: task
  debug: false
  definitions: timeframe
  script:
    - define timeframe daily if:<[timeframe].exists.not>
    - define config <script[mission_craft]>
    # Generate random item and amount from config
    - define map <map.with[id].as[<[config].data_key[id]>]>
    - define map <[map].with[item].as[<[config].data_key[items].random>]>
    - define map <[map].with[max].as[<[config].data_key[amounts].random>]>
    # Add generated name/description later.
    # Give mission
    - run missions_give def:<[timeframe]>|<[map]>

# Completion Task
mission_craft_complete:
  type: task
  debug: false
  script:
    - narrate "You are winning, son!"

# Events
mission_craft_events:
  type: world
  debug: false
  events:
    on player crafts item flagged:missions.active.*.*.craft:
      # Add missions with id craft to a list
      - define missions <proc[missions_get].context[craft]>
      # Check each mission if their item matches the item.
      - foreach <[missions]> as:mission:
        - define item <context.item.script.name.if_null[<context.item.material.name>]>
        - if <player.flag[<[mission]>].get[item]> == <[item]>:
          - run missions_update_progress def:add|<[mission]>|<context.amount>
