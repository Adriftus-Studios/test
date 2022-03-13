hyperspeed_activate:
  type: task
  debug: false
  script:
    - flag player hyperspeed
    - adjust <player> noclip:true
    - define walk_speed <player.walk_speed>
    - adjust <player> walk_speed:1
    - while <player.has_flag[hyperspeed]>:
      - define blocks <player.location.find_blocks.within[10]>
      - showfake <[blocks].filter[y.equals[<player.location.y.sub[1]>]]> concrete duration:5s
      - showfake <[blocks].filter[y.is_more_than[<player.location.y.sub[1]>]]> air duration:5s
      - wait 5t
    - adjust <player> noclip:false
    - adjust <player> walk_speed:<[walk_speed]>
