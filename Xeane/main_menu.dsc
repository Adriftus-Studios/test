main_menu_cosmetics:
  type: item
  debug: false
  material: dragon_head
  display name: <&d>Cosmetics
  lore:
    - "<&e>Control your cosmetics!"
  mechanisms:
    custom_model_data: 1
  flags:
    run_script: cancel

main_menu_help:
  type: item
  debug: false
  material: paper
  display name: <&a>Help!
  lore:
    - "<&e>Request Help!"
  mechanisms:
    custom_model_data: 1
  flags:
    run_script: cancel

main_menu_commands:
  type: item
  debug: false
  material: command_block
  display name: <&6>Commands!
  lore:
    - "<&e>Access your commands!"
  mechanisms:
    custom_model_data: 1
  flags:
    run_script: cancel

main_menu_settings:
  type: item
  debug: false
  material: piston
  display name: <&e>Settings!
  lore:
    - "<&e>Settings for your gameplay"
  mechanisms:
    custom_model_data: 1
  flags:
    run_script: cancel

main_menu_inventory_open:
  type: task
  debug: false
  script:
    - inventory open d:main_menu_inventory

main_menu_inventory:
  type: inventory
  debug: false
  inventory: chest
  gui: true
  title: <&a>Menu Placeholder!
  slots:
    - [] [] [] [] [] [] [] [] []
    - [] [main_menu_help] [] [main_menu_cosmetics] [] [main_menu_commands] [] [main_menu_settings] []
    - [] [] [] [] [] [] [] [] []
