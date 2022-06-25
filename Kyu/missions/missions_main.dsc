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
    # <[filter_key]> == ID
    # <[filter_value]> == Map of CTM
    # - define timeframe <context.args.first>
    # <player.flag[missions.active].filter_tag[<[filter_value].get[timeframe].equals[<[timeframe]>]>]>
    - foreach <player.flag[missions.active]> key:id:
      - narrate <[id]>
      - narrate <[value]>
      - define ctm <[value].keys.first>
      - narrate <[ctm]>
      - define path missions.active.<[id]>.<[ctm]>
      # Update with generated name/description later.
      - narrate <script[mission_<[id]>].data_key[name]>
      - narrate <script[mission_<[id]>].data_key[description].separated_by[<&nl>]>
      - narrate <script[mission_<[id]>].data_key[timeframe]>
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
    - stop if:<[id].exists.not>
    - define missions <list>
    - foreach <player.flag[missions.active.<[id]>]> key:ctm:
      - define missions:->:missions.active.<[id]>.<[ctm]>
    - determine <[missions]>
