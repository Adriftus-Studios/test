# -- PvE Mission - Crafting
mission_craft:
  type: data
  id: craft
  category: PvE
  name: <&a>Craft <&2>-items-
  description:
    - "<&a>Craft <&b>-max- <&2>-items-<&a>."
    - "<&a>Complete this by crafting items."
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
    - define item <[config].data_key[items].keys.random>
    - define name <[item].as_item.display.if_null[<[item].as_item.material.name.replace[_].with[<&sp>].to_titlecase>]>
    - define max <[config].data_key[items.<[item]>].random>
    # Define map
    - define map <map.with[id].as[<[config].data_key[id]>]>
    - define map <[map].with[timeframe].as[<[timeframe]>]>
    - define map <[map].with[item].as[<[item]>]>
    - define map <[map].with[max].as[<[max]>]>
    - define map <[map].with[name].as[<proc[missions_replace_name].context[<[config].parsed_key[name]>|<map[items=<[name]>].escaped>]>]>
    - define map <[map].with[description].as[<proc[missions_replace_description].context[<[config].parsed_key[description].escaped>|<map[items=<[name]>;max=<[max]>].escaped>]>]>
    - define map <[map].with[done].as[false]>
    # Give mission
    - run missions_give def:<[map]>

# Completion Task
mission_craft_complete:
  type: task
  debug: false
  script:
    - narrate "You are crafting, kid!"

# Events
mission_craft_events:
  type: world
  debug: false
  events:
    on player crafts item flagged:missions.active.craft:
      - if <context.click_type> == NUMBER_KEY:
        - stop
      # Add missions with ID craft to a list.
      - define missions <proc[missions_get].context[craft]>
      # Check each mission if their item matches the item.
      - foreach <[missions]> as:mission:
        - if <player.flag[<[mission]>].get[done]>:
          - foreach next
        - define item <context.item.script.name.if_null[<context.item.material.name>]>
        - if <player.flag[<[mission]>].get[item]> == <[item]>:
          - run missions_update_progress def:add|<[mission]>|<context.amount>
