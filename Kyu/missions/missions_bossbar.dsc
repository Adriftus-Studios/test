# -- MISSIONS BOSSBAR PROGRESS NOTIFICATIONS
missions_bossbar:
  type: task
  debug: true
  definitions: path
  script:
    - stop if:<[path].exists.not>
    # Define variables from path
    - define id <player.flag[<[path]>].get[id]>
    - define name <player.flag[<[path]>].get[name]>
    - define x <player.flag[<[path]>].get[progress]>
    - define y <player.flag[<[path]>].get[max]>
    - narrate <[x]>
    - narrate <[y]>
    - narrate <[x].div[<[y]>]>
    # Determine colour
    - choose <script[mission_<[id]>].data_key[category]>:
      - case PvE:
        - define color GREEN
      - case Adventure:
        - define color YELLOW
      - case PvP:
        - define color RED
      - default:
        - define color PURPLE
    # Create bossbar
    - bossbar create <[path]> progress:<[x].div[<[y]>]> color:<[color]> style:SEGMENTED_10
    - flag <player> bossbar.<[path]>
    # Mission Completed
    - if <[x]> == <[y]>:
      - bossbar update <[path]> "title:<[name]> <&f>(<&b>Completed<&f>)"
    # Mission Progressed
    - else:
      - bossbar update <[path]> "title:<[name]> <&f>(<&b><[x]><&f>/<&b><[y]><&f>)"
    # 4t * 15 = 60t = 3s
    - repeat 15:
      - bossbar update <[path]> players:<player>
      - wait 4t
    - bossbar remove <[path]> players:<player>

# Remove bossbars on logout
missions_bossbar_remove:
  type: world
  debug: false
  events:
    on player quits:
      - foreach <player.flag[bossbar].keys> as:bar:
        - bossbar remove <[bar]>
      - flag <player> bossbar:!
