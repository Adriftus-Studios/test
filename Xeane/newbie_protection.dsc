new_player_protections:
  type: world
  debug: false
  events:
    on player dies bukkit_priority:lowest priority:-1 flagged:newbie:
      - determine cancelled
      - teleport <server.worlds.first.spawn_location>
      - narrate "<&a>- <&b>New Player Protection <&a>-"
      - narrate "<&a>You have been saved from death"
    on player damaged bukkit_priority:lowest priority:-1 flagged:newbie:
      - determine <context.final_damage.div[5].round> if:<context.damager.script.exists.not>
    on mcmmo player levels up skill flagged:newbie:
      - if <player.mcmmo.level> >= 2000:
        - flag player newbie:!
      - narrate "<&a>- <&b>New Player Protection <&a>-"
      - narrate "<&c>De-activated, you are power level 2000"
    on mcmmo player levels down skill flagged:newbie:
      - if <player.mcmmo.level> < 2000:
        - flag player newbie:!
      - narrate "<&a>- <&b>New Player Protection <&a>-"
      - narrate "<&6>Activated! <&e>you are power level 2000"
    on player joins:
      - if <player.mcmmo.level> > 2000:
        - flag player newbie:!
      - else:
        - flag player newbie