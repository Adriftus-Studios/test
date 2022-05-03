inventory_logger_deaths:
  type: world
  debug: false
  events:
    on player dies bukkit_priority:MONITOR:
      - stop if:<player.flag[saved_inventory.current].equals[default].not>
      - stop if:<player.inventory.list_contents.is_empty>
      - definemap map:
        location: <player.location>
        inventory: <player.inventory.map_slots>
        time: <util.time_now>
        milli_time: <server.current_time_millis>
      - flag <player> logged_inventories.deaths:->:<[map]>
      - if <player.flag[logged_inventories.deaths].size> > 20:
        - flag <player> logged_inventories.deaths:<player.flag[logged_inventories.deaths].remove[first]>

inventory_logger_logout:
  type: world
  debug: true
  events:
    on player joins:
      - stop if:<player.flag[saved_inventory.current].equals[default].not>
      - stop if:<player.inventory.list_contents.is_empty>
      - definemap map:
        location: <player.location>
        inventory: <player.inventory.map_slots>
        time: <util.time_now>
        milli_time: <server.current_time_millis>
      - flag <player> logged_inventories.logout:->:<[map]>
      - if <player.flag[logged_inventories.logout].size> > 20:
        - flag <player> logged_inventories.logout:<player.flag[logged_inventories.logout].remove[first]>

inventory_logger_list:
  type: task
  debug: false
  definitions: target
  script:
    - define list <list>
    - if <[target].has_flag[logged_inventories.logout]>:
      - define list:|:<[target].flag[logged_inventories.logout]>
    - if <[target].has_flag[logged_inventories.deaths]>:
      - define list:|:<[target].flag[logged_inventories.deaths]>
    - define list <[list].sort_by_number[get[milli_time]]>
    - repeat <[list].size.min[10]>:
      - define this_map <[list].get[<[value]>]>
      - narrate "<&6><[this_map].get[cause]> <&7>- <&e><[this_map].get[time].format>"