back_item:
  type: item
  material: feather
  display name: <&c>Back Crystal
  lore:
    - "<&e>--------------------"
    - "<&e>Return to your last location"
    - "<&e>--------------------"
  flags:
    right_click_script:
      - back_remove_item
      - target_players_open
    callback: back_execute
  mechanisms:
    custom_model_data: 101

back_item_tracker:
  type: world
  debug: false
  events:
    on player teleports bukkit_priority:MONITOR:
      - flag <player> last_location:<context.origin>
    on player dies bukkit_priority:MONITOR:
      - flag <player> last_location:<player.location>

back_execute:
  type: task
  debug: false
  definitions: target
  script:
    - if !<player.has_flag[last_location]>:
      - narrate "<&c>You have no location to return to"
      - stop
    - take iteminhand
    - run totem_test def:101
    - wait 2s
    - ~run teleportation_animation_run def:<player.flag[last_location]> player:<player.flag[tmp.tpa_accept]>
    - wait 1t
    - flag <player> last_location:!