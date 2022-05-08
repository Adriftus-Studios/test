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
      - bossbar remove <player.uuid>.damage_tracker
      - narrate "<&8>[<&c>DMGTracker<&8>] <&c>Toggled DMGTracker." targets:<player>
    - else:
      - flag <player> damage_tracker:true
      - flag <player> on_damage:->:damage_tracker_dealt
      - bossbar create <player.uuid>.damage_tracker players:<player> title:<&sp> progress:1.0 color:YELLOW style:SOLID
      - narrate "<&8>[<&c>DMGTracker<&8>] <&a>Toggled DMGTracker." targets:<player>

damage_tracker_dealt:
  type: task
  debug: false
  script:
    - stop if:<context.cause.is[==].to[ENTITY_SWEEP_ATTACK].or[LIGHTNING]>
    - define text <&6><&lt><&e><&l><context.final_damage.round_to[1]><&6><&gt>
    - define critical <tern[<context.was_critical>].pass[RED].fail[YELLOW]>
    - bossbar update <player.uuid>.damage_tracker title:<[text]> color:<[critical]>
