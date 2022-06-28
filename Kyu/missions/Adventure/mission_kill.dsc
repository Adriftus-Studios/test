# -- PvE Mission - Kill Mobs
mission_kill:
  type: data
  id: kill
  category: PvE
  name: <&a>Kill <&2>-mobs-
  description:
    - "<&a>Kill <&b>-max- <&2>-mobs-<&a>."
  assignment: mission_kill_assignment
  milestones:
    max: mission_kill_complete
  mobs:
    zombie:
      - 2
      - 4
      - 6
      - 8
    skeleton:
      - 2
      - 4
      - 6
      - 8
    creeper:
      - 2
      - 4
      - 6
      - 8


# Assignment Task
mission_kill_assignment:
  type: task
  debug: false
  definitions: timeframe
  script:
    - stop if:<[timeframe].exists.not>
    - define config <script[mission_kill]>
    # Generate random entity and amount from config.
    - define mob <[config].data_key[mobs].keys.random>
    - define name <[mob].as_entity.name.replace[_].with[<&sp>].to_titlecase.if_null[<[mob].as_entity.entity_type.replace[_].with[<&sp>].to_titlecase>]>
    - define max <[config].data_key[mobs.<[mob]>].random>
    # Define map
    - define map <map.with[id].as[<[config].data_key[id]>]>
    - define map <[map].with[timeframe].as[<[timeframe]>]>
    - define map <[map].with[mob].as[<[mob]>]>
    - define map <[map].with[max].as[<[max]>]>
    - define map <[map].with[name].as[<proc[missions_replace_name].context[<[config].parsed_key[name]>|<map[mobs=<[name]>].escaped>]>]>
    - define map <[map].with[description].as[<proc[missions_replace_description].context[<[config].parsed_key[description].escaped>|<map[mobs=<[name]>;max=<[max]>].escaped>]>]>
    - define map <[map].with[done].as[false]>
    # Give mission
    - run missions_give def:<[map]>

# Completion Task
mission_kill_complete:
  type: task
  debug: false
  script:
    - narrate "You are killing, kid!"

# Events
mission_kill_events:
  type: world
  debug: true
  events:
    on entity dies by:player flagged:missions.active.kill:
      - define __player <context.damager>
      # Add missions with ID kill to a list.
      - define missions <proc[missions_get].context[kill]>
      # Check each mission if the slain mob matches the mob.
      - foreach <[missions]> as:mission:
        - if <player.flag[<[mission]>].get[done]>:
          - foreach next
        - define mob <context.entity.script.name.if_null[<context.entity.entity_type>]>
        - if <player.flag[<[mission]>].get[mob]> == <[mob]>:
          - run missions_update_progress def:add|<[mission]>|1
