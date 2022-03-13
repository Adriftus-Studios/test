hyperspeed_activate:
  type: task
  debug: false
  script:
    - flag player hyperspeed
    - adjust <player> noclip:true
    - define walk_speed <player.walk_speed>
    - adjust <player> walk_speed:1
    - while <player.has_flag[hyperspeed]>:
      - define blocks <player.location.below.backward_flat[20].left[20].to_cuboid[<player.location.above[2].forward_flat[20].right[20]>].blocks>
      - showfake <[blocks].filter[y.equals[<player.location.y.sub[1]>]]> dirt duration:5s
      - showfake <[blocks].filter[y.equals[<player.location.y.sub[1]>].not]> air duration:5s
      - wait 5t
    - adjust <player> noclip:false
    - adjust <player> walk_speed:<[walk_speed]>
