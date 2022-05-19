inventory_logger_deaths:
  type: world
  debug: false
  data:
    map:
      cause: Death
      location: <player.location>
      inventory: <player.inventory.map_slots>
      time: <util.time_now>
      uuid: <util.random_uuid>
      milli_time: <server.current_time_millis>
  events:
    on player dies bukkit_priority:MONITOR:
      - stop if:<player.flag[saved_inventory.current].equals[default].not.if_null[false]>
      - stop if:<player.inventory.list_contents.is_empty>
      - flag <player> logged_inventories.deaths:->:<script.parsed_key[data.map]>
      - if <player.flag[logged_inventories.deaths].size> > 20:
        - flag <player> logged_inventories.deaths:<player.flag[logged_inventories.deaths].remove[first]>

inventory_logger_logout:
  type: world
  debug: false
  data:
    map:
      cause: Logout
      location: <player.location>
      inventory: <player.inventory.map_slots>
      time: <util.time_now>
      uuid: <util.random_uuid>
      milli_time: <server.current_time_millis>

  events:
    on player joins:
      - announce test
      - stop if:<player.flag[saved_inventory.current].equals[default].not.if_null[false]>
      - stop if:<player.inventory.list_contents.is_empty>
      - flag <player> logged_inventories.logout:->:<script.parsed_key[data.map]>
      - if <player.flag[logged_inventories.logout].size> > 20:
        - flag <player> logged_inventories.logout:<player.flag[logged_inventories.logout].remove[first]>

inventory_logger_list:
  type: task
  debug: true
  definitions: target
  script:
    - define target <context.item.flag[target]> if:<[target].exists.not>
    - define list <list>
    - if <[target].has_flag[logged_inventories.logout]>:
      - define list:|:<[target].flag[logged_inventories.logout]>
    - if <[target].has_flag[logged_inventories.deaths]>:
      - define list:|:<[target].flag[logged_inventories.deaths]>
    - define list <[list].sort_by_number[get[milli_time]]>
    - if <[list].is_empty>:
      - narrate "<&c>No Saved Inventories Recorded."
      - stop
    - define inventory <inventory[inventory_logger_inventory]>
    - foreach <[list]> as:map:
      - define lore "<&e>Cause<&co> <&f><[map].get[cause]>|<&e>Time<&co> <&f><[map].get[time].format>|<&e>Location<&co> <&f><[map].get[location].simple>"
      - if <[map].get[cause]> == Death:
        - define "list:->:<item[black_wool].with[display=<&6>Logged Inventory;lore=<[lore]>;flag=run_script:inventory_logger_view_inventory;flag=uuid:<[map].get[uuid]>;flag=target:<[target]>]>"
      - else:
        - define "list:->:<item[white_wool].with[display=<&6>Logged Inventory;lore=<[lore]>;flag=run_script:inventory_logger_view_inventory;flag=uuid:<[map].get[uuid]>;flag=target:<[target]>]>"
    - give <[list]> to:<[inventory]>
    - inventory open d:<[inventory]>


inventory_logger_inventory:
  type: inventory
  debug: false
  inventory: chest
  size: 54
  gui: true

inventory_log_open:
  type: command
  name: inventorylog
  description: View a player's saved inventories
  usage: /inventorylog (player)
  tab completions:
    1: <server.online_players.parse[name]>
  script:
    - if <context.args.size> < 1:
      - narrate "<&c>You must specify a player name."
      - stop
    - define target <server.match_player[<context.args.get[1]>].if_null[null]>
    - if <[target]> == null:
      - narrate "<&c>Unknown Player<&co> <&f><context.args.get[1]>"
      - stop
    - run inventory_logger_list def:<[target]>


inventory_logger_view_inventory:
  type: task
  debug: true
  definitions: uuid|target
  script:
    - define target <context.item.flag[target]> if:<[target].exists.not>
    - define uuid <context.item.flag[uuid]> if:<[uuid].exists.not>
    - define list <list>
    - if <[target].has_flag[logged_inventories.logout]>:
      - define list:|:<[target].flag[logged_inventories.logout]>
    - if <[target].has_flag[logged_inventories.deaths]>:
      - define list:|:<[target].flag[logged_inventories.deaths]>
    - if <[list].is_empty>:
      - narrate "<&c>No Saved Inventories Recorded."
      - stop
    - define inventory <inventory[inventory_logger_inventory]>
    - foreach <[list]> as:map:
      - if <[map].get[uuid]> = <[uuid]>:
        - inventory set o:<[map].get[inventory]> d:<[inventory]>

    # Restore Inventory Button
    - inventory set slot:50 "o:player_head[skull_skin=<[target].skull_skin>;display=<&a>Restore Inventory;lore=<&a>Requires Empty Inventory;flag=run_script:inventory_logger_view_inventory_restore;flag=uuid:<[map].get[uuid]>;flag=target:<[target]>]"

    # Back Button
    - inventory set slot:46 o:<item[leather_horse_armor].with[hides=all;display_name=<&a>Back;flag=run_script:inventory_logger_list;flag=target:<[target]>;color=red;custom_model_data=6]>

    - inventory open d:<[inventory]>

inventory_logger_view_inventory_restore:
  type: task
  debug: false
  definitions: target|uuid
  script:
    - define target <context.item.flag[target]> if:<[target].exists.not>
    - define uuid <context.item.flag[uuid]> if:<[uuid].exists.not>