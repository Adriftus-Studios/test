anvil_gui_text_input:
  type: task
  debug: false
  definitions: title|display|lore|callback
  script:
    - define item <item[anvil_gui_item].with[display=<[display]>;lore=<[lore]>;flag=run_script:<[callback]>]>
    - openanvil title:<[title]>
    - inventory set d:<player.open_inventory> slot:1 o:<[item]>
    - inventory set d:<player.open_inventory> slot:3 o:<[item]>

anvil_gui_text_events:
  type: world
  debug: false
  events:
    on player prepares anvil craft anvil_gui_item:
      - determine passively 0
      - determine <context.item.with[material=stone_brick;flag=text_input:<context.new_name>]>
    on player clicks in inventory priority:1:
      - stop if:<context.inventory.id_holder.equals[anvil].not>
      - determine cancelled if:<context.inventory.slot[1].script.name.equals[anvil_gui_item].if_null[false]>

anvil_gui_item:
  type: item
  material: stone
  display name: <&c>DEBUG
