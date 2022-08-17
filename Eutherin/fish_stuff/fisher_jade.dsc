fishbot_frank_menu:
  type: inventory
  debug: false
  inventory: chest
  title: Frank's Inventory
  size: 54
  gui: true
  slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

fishbot_frank_assignment:
  type: assignment
  debug: false
  actions:
    on assignment:
    - trigger name:click state:true
    - trigger name:damage state:true
    on damage:
    - inject fishbot_frank_speech
    on click:
    - inject fishbot_frank_speech


fishbot_frank_speech:
  type: task
  debug: false
  script:
  - if <player.has_flag[fishbot.fishing_now]>:
    - narrate "<&6>Sorry boss, I'm too busy to talk right now, catch me after the trip?"
    - stop
  - if <player.flag[fishbot.caught_items].size> > <element[54].sub[<player.flag[fishbot.barrel_expanded].if_null[0].mul[9]>]>:
    - narrate "<&6>Hey boss, my <&c>barrels are full<&6>. When are you picking up the stuff?"
    - stop
  - else:
    - narrate "<&6>Howdy there, how can I help you?"
    - inventory open d:fishbot_frank_menu
    - stop
