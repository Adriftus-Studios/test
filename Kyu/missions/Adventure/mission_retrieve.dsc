# -- Adventure Mission - Retrieve Mob Drops
mission_retrieve:
  type: data
  id: retrieve
  category: Adventure
  name: <&e>Retrieve <&6>-items-
  description:
    - "<&e>Retrieve <&b>-max- <&7>-items-<&e>."
    - "<&e>Complete this by slaying monsters."
  assignment: mission_retrieve_assignment
  milestones:
    max: mission_retrieve_complete
  items:
    leather:
      - 4
      - 8
      - 16
    beef:
      - 4
      - 8
      - 16
    feather:
      - 4
      - 8
      - 16
    porkchop:
      - 4
      - 8
      - 16
    rabbit:
      - 2
      - 4


# Assignment Task
mission_retrieve_assignment:
  type: task
  debug: false
  definitions: timeframe
  script:
    - stop if:<[timeframe].exists.not>
    - define config <script[mission_retrieve]>
    # Generate random entity and amount from config.
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
mission_retrieve_complete:
  type: task
  debug: false
  script:
    - narrate "You are retrieving, kid!"

# Events
mission_retrieve_events:
  type: world
  debug: true
  events:
    on entity dies by:player:
      - if <context.damager.has_flag[missions.active.retrieve].not>:
        - stop
      - define __player <context.damager>
      # Add missions with ID retrieve to a list.
      - define missions <proc[missions_get].context[retrieve]>
      # Check each mission if the slain mob's drops matches the item.
      - foreach <[missions]> as:mission:
        - if <player.flag[<[mission]>].get[done]>:
          - foreach next
        - define items <context.drops.if_null[<list[]>]>
        - foreach <[items]>:
          - determine passively NO_DROPS
          - define retrieve <player.flag[<[mission]>].get[item].as_item.script.name.if_null[<player.flag[<[mission]>].get[item].as_item.material.name>]>
          - define item <[value].as_item.script.name.if_null[<[value].as_item.material.name>]>
          - if <[retrieve]> == <[item]>:
            - drop <[item]> <context.entity.location> quantity:<[value].as_item.quantity> save:dropped
            - flag <entry[dropped].dropped_entities> on_item_pickup:mission_retrieve_task
          - else:
            - drop <[item]> <context.entity.location> quantity:<[value].as_item.quantity>

# Task
mission_retrieve_task:
  type: task
  debug: true
  script:
    # Add missions with ID retrieve to a list.
    - define missions <proc[missions_get].context[retrieve]>
    # Check each mission if the slain mob's drops matches the item.
    - foreach <[missions]> as:mission:
      - if <player.flag[<[mission]>].get[done]>:
        - foreach next
      - run missions_update_progress def:add|<[mission]>|1
