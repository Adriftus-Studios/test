anvil_gui_text_input:
  type: task
  debug: false
  definitions: title|info|callback
  script:
    - define item <item[anvil_gui_item].with[display=<&a>;lore=<[info]>;flag=run_script:<[callback]>]>
    - openanvil title:<[title]>
    - inventory set d:<player.open_inventory> slot:1 o:<[item]>
    - inventory set d:<player.open_inventory> slot:3 o:<[item]>

anvil_gui_test:
  type: task
  debug: false
  script:
    - narrate <context.item>

anvil_gui_text_events:
  type: world
  debug: false
  events:
    on player prepares anvil craft anvil_gui_item:
      - stop if:<context.inventory.slot[1].script.name.equals[anvil_gui_item].not.if_null[false]>
      - determine passively 0
      - determine <context.item.with[display=<&a>Accept;hides=all;lore=<&e>INPUT|<&b><context.new_name>;flag=text_input:<context.new_name>]>
    on player clicks in inventory priority:1:
      - determine cancelled if:<context.inventory.slot[3].script.name.equals[anvil_gui_item].if_null[false]>

anvil_gui_item:
  type: item
  material: stone
  display name: <&c>DEBUG
