target_players_inventory:
  type: inventory
  inventory: chest
  gui: true
  slots: 54

target_players_open:
  type: task
  debug: false
  definitions: player_list|callback
  script:
    - define inv <inventory[target_players_inventory]>
    - foreach <[player_list]>:
      - give to:<[inv]> player_head[skull_skin=<[value].skull_skin>;custom_model_data=1;display=<[value].proc[get_player_display_name]>;flag=run_script:target_players_open_callback;flag=script:<[callback]>;flag=UUID:<[value].uuid>]
    - inventory open d:<[inv]>

target_players_open_callback:
  type: task
  debug: false
  script:
    - determine passively canceled
    - run <context.item.flag[callback]> def:<context.item.flag[uuid]>