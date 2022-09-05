new_player_protections:
  type: world
  debug: false
  events:
    on player dies bukkit_priority:lowest priority:-1 flagged:newbie:
      - determine cancelled
      - teleport <server.worlds.first.spawn_location>
      - narrate "<&a>- <&b>New Player Protection -"
      - narrate "<&a>You have been saved from death"
    on player damaged bukkit_priority:lowest priority:-1 flagged:newbie:
      - determine <context.final_damage.div[5].round> if:<context.damager.script.exists.not>
    on player joins:
      - if <player.mcmmo.level> > 2000:
        - flag player newbie:!
      - else:
        - flag player newbie