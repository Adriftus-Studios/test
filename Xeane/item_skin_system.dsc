item_skin_system_data:
  type: data
  diamond_axe:
    1000: <&b>Celestial

item_skin_system_inventory:
  type: inventory
  debug: false
  inventory: chest
  size: 54
  gui: true

item_skin_system_update:
  type: task
  debug: false
  data:
    skin_slots: 20|21|22|23|24|25|26|29|30|31|32|33|34|35|38|39|40|41|42|43|44
  definitions: item
  script:
    - define inventory <context.inventory>
    - define material <[item].material>
    - define skin_map <script[item_skin_system_data].parsed_key[<[material]>]>
    - define keys <[skin_map].keys>
    - foreach <script.data_key[data.skin_slots]> as:slot:
      - define key <[keys].get[<[loop_index]>].if_null[air]>
      - if <[key]> == air:
        - inventory set slot:<[slot]> d:<[inventory]> o:air
      - else:
        - inventory set slot:<[slot]> d:<[inventory]> o:<[item].with[custom_model_data=<[key]>;display=<[skin_map].get[<[key]>]>;flag=run_script:item_skin_system_skin_item]>

item_skin_system_events:
  type: world
  debug: false
  events:
    on player clicks in item_skin_system_inventory slot:5 bukkit_priority:HIGHEST cancelled:true:
      - narrate uncancelled
      - determine passively cancelled:false
      - if <context.cursor_item.material.name> != air && <script[item_skin_system_data].data_key[data.<context.cursor_item.material.name>].exists>:
        - define item <context.cursor_item>
        - narrate ITEM <context.cursor_item>
        - inject item_skin_system_update
      - else:
        - define item air
        - narrate ITEM <context.cursor_item>
        - inject item_skin_system_update

item_skin_system_skin_item:
  type: task
  debug: false
  script:
    - inventory adjust slot:5 d:<context.inventory> o:<context.inventory.slot[5].with[custom_model_data=<context.item.custom_model_data>]>