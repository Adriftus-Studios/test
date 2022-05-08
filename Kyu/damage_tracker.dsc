# -- /damagetracker - Damage Tracker Command
damage_tracker_command:
  type: command
  debug: false
  name: damagetracker
  description: Track damage dealt
  permission: adriftus.staff
  usage: /damagetracker
  script:
    - if <player.has_flag[damage_tracker]>:
      # Remove if activated
      - flag <player> damage_tracker:!
      - flag <player> on_damage:<-:damage_tracker_dealt
      - narrate "<&8>[<&c>DMGTracker<&8>] <&c>Toggled DMGTracker." targets:<player>
    - else:
      - flag <player> damage_tracker:true
      - flag <player> on_damage:->:damage_tracker_dealt
      - narrate "<&8>[<&c>DMGTracker<&8>] <&a>Toggled DMGTracker." targets:<player>

damage_tracker_dealt:
  type: task
  debug: false
  script:
    - stop if:<context.cause.is[==].to[ENTITY_SWEEP_ATTACK].or[LIGHTNING]>
    - define text "<&6><&lt><&e><&l><context.final_damage.round_to[1]><tern[<context.was_critical>].pass[<&7>*].fail[<&r>]><&6><&gt>"
    - actionbar <[text]> targets:<player> per_player
