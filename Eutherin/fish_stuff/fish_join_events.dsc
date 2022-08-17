fishbot_join_event:
  type: world
  debug: false
  events:
    on player joins:
      - if <player.flag[fishbot.caught_items].size> > 1:
        - narrate "<&6>You have <&e><player.flag[fishbot.caught_items].size><&6> items waiting for collection at <&e>Frank's Pier<&6>."
        - stop
      - if <player.flag[fishbot.caught_items].size> > 0 && <player.flag[fishbot.caught_items].size> < 2:
        - narrate "<&6>You have <&e><player.flag[fishbot.caught_items].size><&6> item waiting for collection at <&e>Frank's Pier<&6>."
      - if !<player.has_flag[fishbot.frank.experience_earned]>:
        - flag <player> fishbot.frank.experience_earned:0
        - flag <player> fishbot.frank.level:1
