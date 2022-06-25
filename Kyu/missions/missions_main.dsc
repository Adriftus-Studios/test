# -- MISSIONS
# Missions Command
missions_command:
  type: command
  debug: false
  name: missions
  description: Towny Missions
  usage: /missions
  # Tab Complete for daily/weekly/monthly.
  script:
    - foreach <player.flag[missions.active.daily]> key:ctm:
      - narrate <[ctm]>
      - narrate <[value]>
      - define id <[value].keys.first>
      - define path missions.active.daily.<[ctm]>.<[id]>
      # Update with generated name/description later.
      - narrate <script[mission_<[id]>].data_key[name]>
      - narrate <script[mission_<[id]>].data_key[description]>
      - narrate "(<player.flag[<[path]>].get[progress]> / <player.flag[<[path]>].get[max]>)"
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
  definitions: timeframe|map
  script:
    # Stop if definitions are not set.
    - stop if:<[timeframe].exists.not>
    - stop if:<[map].exists.not>
    - stop if:<[map].is_empty>
    - narrate <[timeframe]>
    - narrate <[map]>
    # Define unique identifier and mission ID.
    - define ctm <server.current_time_millis>
    - define id <[map].get[id]>
    - define path missions.active.<[timeframe]>.<[ctm]>.<[id]>
    - foreach <[map]>:
      - flag <player> <[path]>.<[key]>:<[value]>
      - narrate "<[key]>: <[value]>"
    - run missions_update_progress def:set|<[path]>|0


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
    # Update with generated name later.
    - define name <script[mission_<[id]>].data_key[name]>
    - define milestones <script[mission_<[id]>].data_key[milestones]>
    # Add / Set new progress.
    - if <[action]> == add:
      - flag <player> <[path]>.progress:+:<[x]>
    - else if <[action]> == set:
      - flag <player> <[path]>.progress:<[x]>
    # Check for mission milestones in mission config ID.
    - define y <player.flag[<[path]>].get[progress]>
    - if <[y]> >= <[max]>:
      - flag <player> <[path]>.done:true
      - run <script[mission_<[id]>].data_key[milestones.max]>
      - narrate "<[name]> / Progress (<[max]>/<[max]>)"
    - else if <[milestones].contains[<[y]>]>:
      - run <script[mission_<[id]>].data_key[milestones.<[y]>]>
      - narrate "<[name]> / Progress (<[y]>/<[max]>)"
    - else:
      - narrate "<[name]> / Progress (<[y]>/<[max]>)"


# Get Missions with ID
missions_get:
  type: procedure
  debug: false
  definitions: id
  script:
    - define missions <list>
    - foreach daily|weekly|monthly as:timeframe:
      - foreach <player.flag[missions.active.<[timeframe]>]> key:ctm:
        - if <player.flag[missions.active.<[timeframe]>.<[ctm]>].contains[<[value]>]>:
          - define id <[value].get[id]>
          - define missions:->:missions.active.<[timeframe]>.<[ctm]>.<[id]>
    - determine <[missions]>
