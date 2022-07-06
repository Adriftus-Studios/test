# -- MISSIONS GUI
missions_inv:
  type: inventory
  debug: false
  title: <&2>Towny <&a>Missions
  inventory: CHEST
  gui: true
  size: 45
  definitions:
    daily: <item[stone].with[display_name=<&a>Daily;flag=timeframe:daily]>
    weekly: <item[stone].with[display_name=<&e>Weekly;flag=timeframe:weekly]>
    monthly: <item[stone].with[display_name=<&6>Monthly;flag=timeframe:monthly]>
    herocraft: <item[stone].with[display_name=<&b>HeroCraft;flag=timeframe:persistent]>
    none: <item[barrier].with[display_name=<&c>No<&sp>Missions]>
    close: <item[red_stained_glass_pane].with[display_name=<&c><&l>χ<&sp>Close]>
  slots:
    - [] [daily] [] [weekly] [] [monthly] [] [herocraft] []
    - [] [] [] [] [] [] [] [] []
    - [] [none] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [close] [] [] [] [] [] [] [] []

missions_inv_open:
  type: task
  debug: false
  definitions: timeframe
  data:
    slot_data:
      slots: 20|21|22|23|24|25|26
      page: 37
  script:
    # Set definitions
    - define timeframe daily if:<[timeframe].exists.not>
    - define inventory <inventory[missions_inv]>
    - define slots <list[<script.parsed_key[data.slot_data.slots_used]>]>
    - define missions <proc[missions_get_timeframe].context[<[timeframe]>]>
    # Loop over missions with the currently viewed timeframe
    - define items <list>
    - foreach <[missions]> as:mission:
      # Match item display name and lore to information about the mission
      - define id <player.flag[<[mission]>].get[id]>
      - define name <player.flag[<[mission]>].get[name]>
      - define description <player.flag[<[mission]>].get[description]>
      - define progress <&f>(<&b><player.flag[<[mission]>].get[progress]><&f>/<&f><&b><player.flag[<[mission]>].get[max]>)
      - define material <script[mission_<[id]>].data_key[icon]>
      - define cmd <script[mission_<[id]>].data_key[cmd]>
      # Build the final item
      - define item <item[<[material]>].with[display_name=<[name]><&sp><[progress]>;lore=<[description].separated_by[<&nl>]>;custom_model_data=<[cmd]>]>
      # Add item to list
      - define items:->:<[item]>
    # Pagination Item
    - inventory set slot:<script.data_key[data.slot_data.page]> o:<item[red_stained_glass_pane].with[display_name=<&c><&l>χ<&sp>Close;flag=page:<[timeframe]>]> d:<[inventory]>
    # Open inventory
    - inventory open d:<[inventory]>

missions_inv_change:
  type: task
  debug: false
  script:
    - define page_item <context.inventory.slot[<script[mod_online_inv_open].data_key[data.slot_data.page]>]>
    - run missions_inv_open def:<[page_item].flag[page]>

missions_inv_events:
  type: world
  debug: false
  events:
    on player clicks red_stained_glass_pane in missions_inv:
      - inventory close
