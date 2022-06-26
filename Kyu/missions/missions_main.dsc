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
    - if <player.has_flag[missions.active].not>:
      - narrate "You do not have any active missions."
      - stop
    - foreach <player.flag[missions.active]> key:id:
      - narrate <[id]>
      - narrate <[value]>
      - define ctm <[value].keys.first>
      - narrate <[ctm]>
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

# Give Mission
missions_give:
  type: task
  debug: false
  definitions: map
  script:
    # Stop if definitions are not set.
    - stop if:<[map].exists.not>
    - stop if:<[map].is_empty>
    - narrate <[map]>
    # Define mission ID and unique identifier.
    - define id <[map].get[id]>
    - define ctm <server.current_time_millis>
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

