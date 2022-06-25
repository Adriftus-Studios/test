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
    oak_planks:
      - 8
      - 16
      - 32
      - 64
    spruce_planks:
      - 8
      - 16
      - 32
      - 64
    birch_planks:
      - 8
      - 16
      - 32
      - 64
    jungle_planks:
      - 8
      - 16
      - 32
      - 64
    acacia_planks:
      - 8
      - 16
      - 32
      - 64
    dark_oak_planks:
      - 8
      - 16
      - 32
      - 64
    stone_bricks:
      - 32
      - 48
      - 64

# Assignment Task
mission_craft_assignment:
  type: task
  debug: false
  definitions: timeframe
  script:
    - stop if:<[timeframe].exists.not>
    - define config <script[mission_craft]>
    # Generate random item and amount from config.
    - define item <[config].data_key[items].random>
    - define map <map.with[id].as[<[config].data_key[id]>]>
    - define map <[map].with[timeframe].as[<[timeframe]>]>
    - define map <[map].with[item].as[<[item]>]>
    - define map <[map].with[max].as[<[config].data_key[items.<[item]>].random>]>
    - define map <[map].with[name].as[<[config].data_key[name].replace[X].with[<[map].get[max]>].replace[items].with[<[item].as_item.display>]>]>
    - define map <[map].with[description].as[<[config].data_key[description].replace[Items].with[<[item].as_item.display>]>]>
    - define map <[map].with[done].as[false]>
    # Add generated name/description later.
    # Give mission
    - run missions_give def:<[map]>

# Completion Task
mission_craft_complete:
  type: task
  debug: false
  script:
    - narrate "You are winning, son!"

# Events
mission_craft_events:
  type: world
  debug: true
  events:
    on player crafts item flagged:missions.active.craft:
      # Add missions with ID craft to a list.
      - define missions <proc[missions_get].context[craft]>
      # Check each mission if their item matches the item.
      - foreach <[missions]> as:mission:
        - define item <context.item.script.name.if_null[<context.item.material.name>]>
        - if <player.flag[<[mission]>].get[item]> == <[item]>:
          - run missions_update_progress def:add|<[mission]>|<context.amount>
