back_crystal:
  type: item
  material: feather
  display name: <&c>Back Crystal
  data:
    recipe_book_category: travel
  lore:
    - "<&e>--------------------"
    - "<&e>Return to your last location"
    - "<&e>--------------------"
  flags:
    right_click_script:
      - back_execute
    callback: back_execute
    type: crystal
  mechanisms:
    custom_model_data: 101

back_scroll:
  type: item
  material: feather
  display name: <&c>Scrol of Recall
  data:
    recipe_book_category: travel
  lore:
    - "<&e>--------------------"
    - "<&e>Return to your last location"
    - "<&e>--------------------"
  flags:
    right_click_script:
      - back_execute
    callback: back_execute
    type: scroll
  mechanisms:
    custom_model_data: 101

back_item_tracker:
  type: world
  debug: false
  events:
    # Disabled due to teleportation animations
    #on player teleports bukkit_priority:MONITOR:
      #- flag <player> last_location:<context.origin>
    on player dies bukkit_priority:MONITOR:
      - flag <player> last_location:<player.location>

back_execute:
  type: task
  debug: false
  script:
    - if !<player.has_flag[last_location]>:
      - narrate "<&c>You have no location to return to"
      - stop
    - define type <context.item.flag[type]>
    - if <[type]> == scroll && <player.flag[last_location].world> != <player.location.world>:
      - narrate "<&c>This item lacks the power for cross dimensional travel"
      - stop
    - take iteminhand
    - run totem_test def:101
    - wait 2s
    - ~run teleportation_animation_run def:<player.flag[last_location]>
    - wait 1t
    - flag <player> last_location:!