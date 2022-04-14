combat_tag:
    type: world
    debug: false
    events:
        on player damaged by player:
            - flag <context.damager> combat_tag expire:30s if:<context.damager.is_player>
            - flag <context.entity> combat_tag expire:30s if:<context.entity.is_player>
            - ratelimit <player> 30s
            - narrate "<yellow><bold>You have been combat-tagged. Do not log out!" targets:<context.damager>|<context.entity>
            - wait 30s
            - narrate "<yellow><bold>You are no longer in combat."
        on player dies flagged:combat_tag:
            - flag <player> combat_tag:!
            - narrate "<yellow><bold>You are no longer in combat."
        on player quit flagged:combat_tag:
            #instant kill then forced respawn
            - flag <player> killspawn:<player.location>
            - kill <player>
            - adjust <player> respawn:true
            - teleport <player> <player.flag[killspawn]>
            - flag <player> killspawn:!
            - flag <player> combat_tag:!
#Still in the works