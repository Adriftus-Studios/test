travel_menu_open:
  type: task
  debug: false
  data:
    slots_by_count:
      1: 14
      2: 13|15
      3: 11|14|17
      4: 11|13|15|17
      5: 12|22|14|24|16
      6: 11|21|13|15|25|17
      7: 11|21|13|23|15|25|17
      8: 11|29|13|31|15|33|17|35
  # Theses are accessible anywhere in the network
  network:
    - foreach <yaml[bungee_config].list_keys[servers]> as:server:
      - if !<yaml[bungee_config].contains[servers.<[server]>.show_in_play_menu]> || <yaml[bungee_config].read[servers.<[server]>.show_in_play_menu]>:
        - foreach next
      - if <yaml[bungee_config].read[servers.<[server]>.restricted]||true> && !<player.has_permission[bungee.server.<[server]>]>:
        - foreach next
      - define display <yaml[bungee_config].read[servers.<[server]>.display_name].parsed>
      - define lore <yaml[bungee_config].read[servers.<[server]>.description].parsed>
      - define item <yaml[bungee_config].read[servers.<[server]>.material].parsed>
      - define item_list:|:<[item].with[diplay=<[display]>;lore=<[lore]>;flag=run_script:travel_menu_to_server;flag=server:<[server]>]>
  # These are specific to the test server
  test:
    - foreach <server.worlds> as:world:
      - define display "<&e>Teleport To <&b><[world].name.replace[_].with[<&sp>].to_titlecase>"
      - define item_list:|:<item[grass_block].with[diplay=<[display]>;flag=run_script:travel_menu_to_world;flag=world:<[world]>]>
  # This task handles the final building of the inventory
  build_inventory:
    - define size <[item_list].size>
    - if <[size]> == 0:
      - determine cancelled
    - define inventory <inventory[travel_menu_inventory]>
    - foreach <script.data_key[<[size]>]>:
      - inventory set slot:<[value]> o:<[item_list].get[<[loop_index]>]> d:<[inventory]>
  script:
    - define item_list <list>
    - inject locally path:network
    - if <script.data_key[<bungee.server>].exists>:
      - inject locally path:<bungee.server>
    - inject locally path:build_inventory
    - inventory open d:<[inventory]>

travel_menu_to_world:
  type: task
  debug: false
  script:
    - teleport <player> <context.item.flag[world].spawn_location>

travel_menu_to_server:
  type: task
  debug: false
  script:
    - adjust <player> send_to:<context.item.flag[server]>

travel_menu_inventory:
  type: inventory
  debug: false
  inventory: chest
  title: <&a>Travel!
  size: 54
  slots:
    - [1] [2] [3] [4] [5] [6] [7] [8] [9]
    - [10] [11] [12] [13] [14] [15] [16] [17] [18]
    - [19] [20] [21] [22] [23] [24] [25] [26] [27]
    - [28] [29] [30] [31] [32] [33] [34] [35] [36]
    - [37] [38] [39] [40] [41] [42] [43] [44] [45]