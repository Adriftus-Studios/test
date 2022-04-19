combat_tag:
    type: world
    debug: false
    events:
        on player damaged by player:
            #Flag the attacking player and the attacked player
            - ratelimit <context.damager>|<context.entity> 30s
            - flag <context.damager>|<context.entity> combat_tag expire:30s
            - flag <context.entity> combat_tag expire:30s
            - narrate "<yellow><bold>You have been combat-tagged. Do not log out!" targets:<context.damager>|<context.entity>
            - waituntil !<player.has_flag[combat_tag]>
            - if !<player.has_flag[combat_tag]>:
                - narrate "<yellow><bold>You are no longer in combat."
        on player dies flagged:combat_tag:
            - flag <context.entity> combat_tag:!
            - narrate "<yellow><bold>You are no longer in combat."
        on player quit flagged:combat_tag:
            #instant kill then forced respawn
            - kill <player>
            - flag <player> combat_tag:!
            - flag <player> quit_during_combat
        on player joins flagged:quit_during_combat:
            - flag <player> combat_tag_quit:!
            - adjust <player> respawn
            - waituntil <player.is_living>
            - narrate "<red>You logged out while in combat, and died!"
#Still in the works