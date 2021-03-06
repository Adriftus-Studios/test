item_skin_system_data:
  type: data
  diamond_axe:
    1000: <&b>Celestial
    1001: <&2>Blue
    1002: <&b>Bright
    1003: <&6>Nordic
    1004: <&c>Viking
    1005: <&d>Wizard
    1006: <&4>Bloody
    1007: <&e>Double
    1008: <&b>Glowing
    1009: <&7>Black Handle
    1010: <&1>Natural
    1011: <&b>Shimmering
    1012: <&5>Fireman
    1013: <&c>Battle
    1014: <element[Christmas].color_gradient[from=<&c>;to=<&2>]>

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
    - define skin_map <script[item_skin_system_data].parsed_key[<[material].name>]>
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
      - determine passively cancelled:false
      - define item <context.cursor_item>
      - inject item_skin_system_update

item_skin_system_skin_item:
  type: task
  debug: false
  script:
    - inventory adjust slot:5 d:<context.inventory> custom_model_data:<context.item.custom_model_data>