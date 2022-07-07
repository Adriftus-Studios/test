# -- MISSIONS ASSIGN ON JOIN
missions_assign:
  type: world
  debug: true
  events:
    on player joins:
      # Daily
      - if <player.has_flag[missions_daily].not>:
        - run missions_reset def:daily
        - run missions_generate def:daily
        - flag <player> missions_daily:true
      # Weekly
      - if <player.has_flag[missions_weekly].not>:
        - run missions_reset def:weekly
        - run missions_generate def:weekly
        - flag <player> missions_weekly:true
      # Monthly
      - if <player.has_flag[missions_monthly].not>:
        - run missions_reset def:monthly
        - run missions_generate def:monthly
        - flag <player> missions_monthly:true
