PvP_tagging:
  type: world
  debug: false
  events:
    on player damages player:
      - if !<context.entity.has_flag[pvp]>:
        - define targets:->:<context.entity
      - if !<context.damager.has_flag[pvp]>:
        - define targets:->:<context.damager
      - title "title:<&4>PvP Flagged" fade_in:10t stay:1s fade_out:10t targets:<[targets]>
      - flag <context.damager>|<context.entity> pvp expire:30s
    on player dies bukkit_priority:MONITOR flagged:pvp:
      - flag <player> pvp:!