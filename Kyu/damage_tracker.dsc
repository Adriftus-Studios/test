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
      - narrate "<&8>[<&c>DMGTracker<&8>] <&c>Toggled DMGTracker." targets:<player>
    - else:
      - flag <player> on_damaged:->:damage_tracker_taken
      - flag <player> on_damage:->:damage_tracker_dealt
      - narrate "<&8>[<&c>DMGTracker<&8>] <&a>Toggled DMGTracker." targets:<player>

damage_tracker_taken:
  type: task
  debug: false
  script:
    - define text "<&4><&gt><&c><&l><context.final_damage.round_to[1]><tern[<context.was_critical>].pass[<&7>*].fail[<&r>]><&4><&lt>"
    - actionbar <[text]> targets:<player> per_player

damage_tracker_dealt:
  type: task
  debug: false
  script:
    - define text "<&6><&lt><&e><&l><context.final_damage.round_to[1]><tern[<context.was_critical>].pass[<&7>*].fail[<&r>]><&6><&gt>"
    - actionbar <[text]> targets:<player> per_player
