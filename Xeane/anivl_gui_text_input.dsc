anvil_gui_text_input:
  type: task
  debug: false
  definitions: title|display|lore|callback
  script:
    - define item <item[anvil_gui_item].with[display=<[display]>;lore=<[lore]>;flag=callback:<[callback]>]>
    - openanvil title:<[title]>
    - inventory set d:<player.open_inventory> slot:1 o:<[item]>
    - inventory set d:<player.open_inventory> slot:3 o:<[item]>

anvil_gui_text_events:
  type: world
  debug: false
  events:
    on player prepares anvil craft anvil_gui_item:
      - narrate TEST!
    on player clicks in inventory:
      - stop if:<context.inventory.id_holder.equals[anvil].not>
      - determine cancelled if:<context.inventory.slot[1].script.name.equals[anvil_gui_item].if_null[false]>

anvil_gui_item:
  type: item
  material: stone
  display name: <&c>DEBUG
