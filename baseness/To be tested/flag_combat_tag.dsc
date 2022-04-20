combat_tag:
    type: world
    debug: false
    events:
        on player damaged by player:
            #Flag the attacking player and the attacked player
            - ratelimit <context.damager>|<context.entity> 30s
            - flag <context.damager>|<context.entity> combat_tag expire:30s
            - narrate "<yellow><bold>You have attacked <context.entity.name>. Do not log out!" targets:<context.damager>
            - narrate "<yellow><bold>You have been attacked by <context.damager.name>. Do not log out!" targets:<context.entity>
            - wait 31s if:<context>
            - if !<context.entity.has_flag[combat_tag]>:
                - narrate "<yellow><bold>You are no longer in combat."
            - if !<context.damager.has_flag[combat_tag]>:
                - narrate "<yellow><bold>You are no longer in combat."
        on player dies flagged:combat_tag:
            - flag <context.entity> died_during_combat
            - flag <context.entity> combat_tag:!
        on player quit flagged:combat_tag:
            - kill <player>
            - flag <player> combat_tag:!
            - flag <player> quit_during_combat
        on player joins flagged:quit_during_combat:
            - flag <player> quit_during_combat:!
            - adjust <player> respawn
            - waituntil <player.is_living>
            - narrate "<red>You logged out while in combat, and died!"
#Still in the works