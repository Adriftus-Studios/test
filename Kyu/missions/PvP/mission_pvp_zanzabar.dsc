# -- PvP Mission - Kill Players in Zanzabar
mission_pvp_zanzabar:
  type: data
  id: pvp_zanzabar
  category: PvP
  name: <&c>Kill <&4>Players
  description:
    - "<&c>Kill <&b>-max- <&4>Players."
    - "<&e>Complete this by killing other players in Zanzabar."
  assignment: mission_pvp_zanzabar_assignment
  milestones:
    max: mission_pvp_zanzabar_complete
  players:
    - 1
    - 2
    - 3


# Assignment Task
mission_pvp_zanzabar_assignment:
  type: task
  debug: false
  definitions: timeframe
  script:
    - stop if:<[timeframe].exists.not>
    - define config <script[mission_pvp_zanzabar]>
    # Generate random amount from config.
    - define max <[config].data_key[players].random>
    # Define map
    - define map <map.with[id].as[<[config].data_key[id]>]>
    - define map <[map].with[timeframe].as[<[timeframe]>]>
    - define map <[map].with[max].as[<[max]>]>
    - define map <[map].with[name].as[<[config].data_key[name]>]>
    - define map <[map].with[description].as[<proc[missions_replace_description].context[<[config].parsed_key[description].escaped>|<map[max=<[max]>].escaped>]>]>
    - define map <[map].with[done].as[false]>
    # Give mission
    - run missions_give def:<[map]>

# Completion Task
mission_pvp_zanzabar_complete:
  type: task
  debug: false
  script:
    - narrate "You are an assassin, kid!"

# Events
mission_pvp_zanzabar_events:
  type: world
  debug: false
  events:
    on player killed by entity_flagged:missions.active.pvp_zanzabar:
      #- if <bungee.server> != zanzabar:
      #  - stop
      - if <context.damager.entity_type> != PLAYER:
        - stop
      - define __player <context.damager>
      # Add missions with ID pvp_zanzabar to a list.
      - define missions <proc[missions_get].context[pvp_zanzabar]>
      # Check each mission if the slain mob matches the mob.
      - foreach <[missions]> as:mission:
        - if <player.flag[<[mission]>].get[done]>:
          - foreach next
        - run missions_update_progress def:add|<[mission]>|1
