anvil_gui_text_input:
  type: task
  debug: false
  definitions: title|display|lore|callback
  script:
    - define item <item[anvil_gui_item].with[display=<[display]>;lore=<[lore]>;flag=callback:<[callback]>]>
    - openanvil title:<[title]>
    - inventory set d:<player.open_inventory> slot:1 o:<[item]>

anvil_gui_item:
  type: item
  material: stone
  display name: <&c>DEBUG
  