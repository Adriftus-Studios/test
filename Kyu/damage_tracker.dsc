# -- /damagetracker - Damage Tracker Command
damage_tracker_command:
  type: command
  debug: false
  name: damagetracker
  description: Track damage taken and dealt
  permission: adriftus.staff
  usage: /damagetracker
  script:
    - if <player.has_flag[damage_tracker]>:
      # Remove if activated
      - flag <player> on_damaged:<-:damage_tracker_taken
      - flag <player> on_damage:<-:damage_tracker_dealt
    - else:
      - flag <player> on_damaged:->:damage_tracker_taken
      - flag <player> on_damage:->:damage_tracker_dealt

damage_tracker_taken:
  type: task
  debug: false
  script:
    - define text "<&4><&gt><&c><context.final_damage><tern[<context.was_critical>].pass[<&7>*].fail[<&r>]><&4><&lt>"
    - actionbar <[text]> targets:<player> per_player

damage_tracker_dealt:
  type: task
  debug: false
  script:
    - define text "<&6><&lt><&e><context.final_damage><tern[<context.was_critical>].pass[<&7>*].fail[<&r>]><&6><&gt>"
    - actionbar <[text]> targets:<player> per_player
