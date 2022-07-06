# -- MISSIONS
# -- NOTES:
# -- Switch from narrate to bossbar notification in missions_update_progress.

# Missions Command
missions_command:
  type: command
  debug: false
  name: missions
  description: Towny Missions
  usage: /missions
  # Tab Complete for daily/weekly/monthly.
  script:
    # <[filter_key]> == CTM
    # <[filter_value]> == Map of CTM
    # - define timeframe <context.args.first>
    # <player.flag[missions.active.<[id]>].filter_tag[<[filter_value].get[timeframe].equals[<[timeframe]>]>]>
    - if <player.has_flag[missions.active].not> || <player.flag[missions.active].if_null[<map>]> == <map>:
      - narrate "You do not have any active missions."
      - stop
    - foreach <player.flag[missions.active]> key:id:
      - define ctm <[value].keys.first>
      - define path missions.active.<[id]>.<[ctm]>
      - narrate <player.flag[<[path]>].get[name]>
      - narrate <player.flag[<[path]>].get[description].separated_by[<&nl>]>
      - narrate <player.flag[<[path]>].get[timeframe]>
      - narrate "Progress: (<player.flag[<[path]>].get[progress]> / <player.flag[<[path]>].get[max]>)"
      - narrate "Completed: <player.flag[<[path]>].get[done].to_titlecase>"

# Generate Missions
missions_generate:
  type: task
  debug: false
  definitions: timeframe
  script:
    # Stop if timeframe is not set.
    - stop if:<[timeframe].exists.not>
    # Define config and missions list.
    - define config <script[missions_config]>
    - define missions <[config].data_key[missions]>
    # Prevent duplicate missions.
    - define list <list>
    - while <[list].size> < <[config].data_key[<[timeframe]>]>:
      - define mission <[missions].random>
      # Skip if mission is already added.
      - if <[list].contains[<[mission]>]>:
        - while next
      - define list:->:<[mission]>
    # Assign missions.
    - foreach <[list]> as:mission:
      - run <script[mission_<[mission]>].data_key[assignment]> def:<[timeframe]>

# Reset Missions
missions_reset:
  type: task
  debug: false
  definitions: timeframe
  script:
    # Stop if timeframe is not set.
    - stop if:<[timeframe].exists.not>
    # Define config and missions list.
    - define config <script[missions_config]>
    - define missions <[config].data_key[missions]>
    # Loop over mission IDs.
    - foreach <[missions]> as:id:
      # Skip if player does not have any missions with ID.
      - if <player.has_flag[missions.active.<[id]>].not> || <player.flag[missions.active.<[id]>].if_null[<map>]> == <map>:
        - foreach next
      # Loop over missions.
      - foreach <player.flag[missions.active.<[id]>].keys> as:ctm:
        # Remove if same timeframe.
        - if <player.flag[missions.active.<[id]>.<[ctm]>].get[timeframe]> == <[timeframe]>:
          - flag <player> missions.active.<[id]>.<[ctm]>:!
      # Remove if mission ID is now empty.
      - if <player.flag[missions.active.<[id]>].if_null[<map>]> == <map>:
        - flag <player> missions.active.<[id]>:!

# Give Mission
missions_give:
  type: task
  debug: false
  definitions: map
  script:
    # Stop if definitions are not set.
    - stop if:<[map].exists.not>
    - stop if:<[map].is_empty>
    # Define mission ID and unique identifier.
    - define id <[map].get[id]>
    - define ctm <util.current_time_millis.if_null[<server.current_time_millis>]>
    - define path missions.active.<[id]>.<[ctm]>
    - foreach <[map]>:
      - flag <player> <[path]>.<[key]>:<[value]>
      - narrate "<[key]>: <[value]>"
    - run missions_update_progress def:set|<[path]>|0

# Get Missions with ID
missions_get:
  type: procedure
  debug: false
  definitions: id
  script:
    - stop if:<[id].exists.not>
    - define missions <list>
    - foreach <player.flag[missions.active.<[id]>]> key:ctm:
      - define missions:->:missions.active.<[id]>.<[ctm]>
    - determine <[missions]>

# Get missions with timeframe
missions_get_timeframe:
  type: procedure
  debug: false
  definitions: timeframe
  script:
    - stop if:<[timeframe].exists.not>
    - define missions <list>
    # Define config and missions list.
    - define config <script[missions_config]>
    - define ids <[config].data_key[missions]>
    # Loop over mission IDs.
    - foreach <[ids]> as:id:
      # Skip if player does not have any missions with ID.
      - if <player.has_flag[missions.active.<[id]>].not> || <player.flag[missions.active.<[id]>].if_null[<map>]> == <map>:
        - foreach next
      # Loop over missions.
      - foreach <player.flag[missions.active.<[id]>].keys> as:ctm:
        # Add to list if same timeframe
        - if <player.flag[missions.active.<[id]>.<[ctm]>].get[timeframe]> == <[timeframe]>:
          - define missions:->:missions.active.<[id]>.<[ctm]>
    - determine <[missions]>

# Update Mission Progress
missions_update_progress:
  type: task
  debug: false
  definitions: action|path|x
  script:
    # Stop if definitions are not set
    - stop if:<[action].exists.not>
    - stop if:<[path].exists.not>
    - stop if:<[x].exists.not>
    # Get definitions from path.
    - define id <player.flag[<[path]>].get[id]>
    - define max <player.flag[<[path]>].get[max]>
    - define milestones <script[mission_<[id]>].data_key[milestones]>
    # Add / Set new progress.
    - if <[action]> == add:
      - flag <player> <[path]>.progress:+:<[x]>
    - else if <[action]> == set:
      - flag <player> <[path]>.progress:<[x]>
    # Check for mission milestones in mission config ID.
    - define y <player.flag[<[path]>].get[progress]>
    - if <[y]> >= <[max]>:
      - flag <player> <[path]>.progress:<[max]>
      - flag <player> <[path]>.done:true
      - run <script[mission_<[id]>].data_key[milestones.max]>
    - else if <[milestones].contains[<[y]>]>:
      - run <script[mission_<[id]>].data_key[milestones.<[y]>]>
    - run missions_bossbar def:<[path]>

