# -- MISSIONS BOSSBAR PROGRESS NOTIFICATIONS
missions_bossbar:
  type: task
  debug: false
  definitions: path
  script:
    - stop if:<[path].exists.not>
    # Define variables from path
    - define id <player.flag[<[path]>].get[id]>
    - define name <player.flag[<[path]>].get[name]>
    - define x <player.flag[<[path]>].get[progress]>
    - define y <player.flag[<[path]>].get[max]>
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
    # Set progress, color, and style
    - if <server.current_bossbars.contains[<[path]>].not>:
      - bossbar create <[path]> progress:<[x].div[<[y]>]> color:<[color]> style:SEGMENTED_10
      - flag <player> bossbar:->:bossbar.<[path]>
    - else:
      - bossbar update <[path]> progress:<[x].div[<[y]>]> color:<[color]> style:SEGMENTED_10
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

# Create bossbars on login
missions_bossbar_create:
  type: world
  debug: false
  events:
    on player joins:
      - foreach active|persistent as:lifespan:
        - if <player.has_flag[missions.<[lifespan]>].not>:
          - foreach next
        - foreach <player.flag[missions.<[lifespan]>]> key:id as:mission:
          - if <player.has_flag[missions.<[lifespan]>.<[id]>].not>:
            - foreach next
          - define ctm <player.flag[<[mission].keys.first>]>
          - if <player.flag[missions.<[lifespan]>.<[id]>.<[ctm]>].get[done].not>:
            - bossbar create missions.<[lifespan]>.<[id]>.<[ctm]>
            - flag <player> bossbar:->:bossbar.missions.<[lifespan]>.<[id]>.<[ctm]>


# Remove bossbars on logout
missions_bossbar_remove:
  type: world
  debug: false
  events:
    on player quits:
      - foreach <player.flag[bossbar]> as:bar:
        - bossbar remove <[bar]>
      - flag <player> bossbar:!
