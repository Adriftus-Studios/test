# -- MISSIONS GUI
missions_inv:
  type: inventory
  debug: false
  title: <&2>Towny <&a>Missions
  inventory: CHEST
  gui: true
  size: 54
  definitions:
    daily: <item[stone].with[display_name=<&a>Daily]>
    weekly: <item[stone].with[display_name=<&e>Weekly]>
    monthly: <item[stone].with[display_name=<&6>Monthly]>
    herocraft: <item[stone].with[display_name=<&b>HeroCraft]>
    close: <item[red_stained_glass_pane].with[display_name=<&c><&l>χ<&sp>Close]>
  slots:
    - [] [daily] [] [weekly] [] [monthly] [] [herocraft] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [close] [] [] [] [] [] [] [] []

missions_inv_open:
  type: task
  debug: false
  definitions: timeframe
  script:
    - define inventory <inventory[missions_inv]>
    # Open inventory
    - inventory open d:<[inventory]>

