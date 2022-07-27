cosmetic_selection_plushies_menu:
  type: inventory
  debug: false
  inventory: chest
  title: <&f><&font[adriftus:cosmetics_guis]><&chr[F808]><&chr[1010]>
  gui: true
  size: 54

cosmetic_plushies_info:
  type: item
  material: feather
  mechanisms:
    custom_model_data: 3

cosmetic_selection_inventory_open2:
  type: task
  debug: true
  definitions: type|page|entity
  gui: true
  data:
    slot_data:
      slots_used: 11|12|13|14|15|16|17|20|21|22|23|24|25|26|29|30|31|32|33|34|35
      remove_slot: 50
      next_page: 53
      previous_page: 47
      plushy_pickup: 54
      back: 1
    plushies:
      players_list: <yaml[global.player.<player.uuid>].list_keys[plushies.unlocked].if_null[<list>]>
      material: <server.flag[plushies.ids.<[cosmetic]>].parsed_key[display_data.material]>
      display_name: <server.flag[plushies.ids.<[cosmetic]>].parsed_key[display_data.display_name]>
      description: <server.flag[plushies.ids.<[cosmetic]>].parsed_key[display_data.description]> #this might have to be lore as the key
      preview: "<&e>Plush<&co> <&r><server.flag[plushies.ids.<[cosmetic]>].parsed_key[display_data.display_name]>"
      current: <server.flag[plushies.current_locations].get[<[entity].location>]>
      equip_task: plushies_equip
      remove_task: plushies_remove
    toys:
      players_list: <yaml[global.player.<player.uuid>].list_keys[toys.unlocked].if_null[<list>]>
      material: <server.flag[toys.ids.<[cosmetic]>].parsed_key[display_data.material]>
      display_name: <server.flag[toys.ids.<[cosmetic]>].parsed_key[display_data.display_name]>
      description: <server.flag[toys.ids.<[cosmetic]>].parsed_key[display_data.description]>
      preview: "<&e>Toy<&co> <&r><server.flag[toys.ids.<[cosmetic]>].parsed_key[display_data.display_name]>"
      current: <yaml[global.player.<player.uuid>].read[toys.current.id].if_null[default]>
      equip_task: toy_equip
      remove_task: toy_remove
    masks:
      players_list: <yaml[global.player.<player.uuid>].list_keys[masks.unlocked].if_null[<list>]>
      material: <server.flag[masks.ids.<[cosmetic]>].parsed_key[display_data.material]>
      display_name: <server.flag[masks.ids.<[cosmetic]>].parsed_key[display_data.display_name]>
      description: <server.flag[masks.ids.<[cosmetic]>].parsed_key[display_data.description]>
      preview: "<&e>Disguised Name<&co> <&r><server.flag[masks.ids.<[cosmetic]>].parsed_key[mask_data.display_name]>"
      current: <yaml[global.player.<player.uuid>].read[masks.current.id].if_null[default]>
      equip_task: mask_wear
      remove_task: mask_remove
    titles:
      players_list: <yaml[global.player.<player.uuid>].list_keys[titles.unlocked].if_null[<list>]>
      material: name_tag
      display_name: <[cosmetic]>
      preview: "<&e>Preview<&co> <&r><yaml[titles].parsed_key[titles.<[cosmetic]>.tag].parse_color>"
      description: <yaml[titles].parsed_key[titles.<[cosmetic]>.description].parse_color>
      current: <yaml[global.player.<player.uuid>].read[titles.current].if_null[default]>
      equip_task: titles_equip
      remove_task: titles_remove
    bowtrails:
      players_list: <yaml[global.player.<player.uuid>].list_keys[bowtrails.unlocked].if_null[<list>]>
      material: <yaml[bowtrails].read[bowtrails.<[cosmetic]>.icon]>
      display_name: <yaml[bowtrails].parsed_key[bowtrails.<[cosmetic]>.name].parse_color>
      preview: "<&e>Trail Type<&co> <&r><&f><yaml[bowtrails].parsed_key[bowtrails.<[cosmetic]>.trail_type].replace_text[_].with[<&sp>].to_titlecase>"
      description: <yaml[bowtrails].parsed_key[bowtrails.<[cosmetic]>.description].parse_color>
      current: <yaml[global.player.<player.uuid>].read[bowtrails.current].if_null[default]>
      equip_task: bowtrails_equip
      remove_task: bowtrails_remove
    hats:
      players_list: <yaml[global.player.<player.uuid>].list_keys[hats.unlocked].if_null[<list>]>
      material: <server.flag[hats.ids.<[cosmetic]>].parsed_key[hat_data.material]>
      display_name: <server.flag[hats.ids.<[cosmetic]>].parsed_key[hat_data.display_name]>
      description: <server.flag[hats.ids.<[cosmetic]>].parsed_key[hat_data.description]>
      preview: "<&e>Check out the Hat Shop for previews!"
      current: <yaml[global.player.<player.uuid>].read[hats.current.id].if_null[default]>
      equip_task: hat_wear
      remove_task: hat_remove
  script:
    # Sanity Check
    - if !<[type].exists>:
      - define type <context.item.flag[cosmetic_type]>
    - if !<script.data_key[data.<[type]>.players_list].exists>:
      - determine cancelled

    # Define our initialization data
    - define page 1 if:<[page].exists.not>
    - define slots <list[<script.data_key[data.slot_data.slots_used]>]>
    - define start <[page].sub[1].mul[<[slots].size>].add[1]>
    - define end <[slots].size.mul[<[page]>]>
    - define cosmetics <script.parsed_key[data.<[type]>.players_list]>

    # Build the cosmetic icons
    - if !<[cosmetics].is_empty>:
      - foreach <[cosmetics].get[<[start]>].to[<[end]>]> as:cosmetic:
        - define material <script.parsed_key[data.<[type]>.material]>
        - define display <script.parsed_key[data.<[type]>.display_name]>
        - define preview <script.parsed_key[data.<[type]>.preview]>
        - define description <script.parsed_key[data.<[type]>.description]>
        - define lore <script[cosmetic_configuration].parsed_key[display_data.lore]>
        - if <[type]> == plushies && !<[entity].exists>:
          - define items:|:<item[<[material]>].with[lore=<[lore]>;flag=cosmetic:<[cosmetic]>]>
        - else:
          - define equip_script <script.parsed_key[data.<[type]>.equip_task]>
          - define items:|:<item[<[material]>].with[lore=<[lore]>;flag=run_script:<[equip_script]>;flag=cosmetic:<[cosmetic]>]>
    - if <[entity].exists>:
      - define inventory <inventory[plushy_display_gui]>
    - else:
      - define inventory <inventory[cosmetic_selection_<[type]>_menu]>

    # Put the items into the new inventory
    - if <[items].exists>:
      - foreach <[items]>:
        - inventory set slot:<[slots].get[<[loop_index]>]> o:<[value].with[display=<&6>]> d:<[inventory]>

    # Build the "unequip cosmetic" item, and store pagination data on it
    - if <[type]> == plushies && !<[entity].exists>:
      - inventory set slot:<script.data_key[data.slot_data.remove_slot]> o:<item[cosmetic_plushies_info]> d:<[inventory]>
    - else:
      - define cosmetic <script.parsed_key[data.<[type]>.current]>
      - if <[cosmetic]> != default:
        - define material <script.parsed_key[data.<[type]>.material]>
        - define display "<&e>Unequip Cosmetic"
        - define lore "<&b>Left Click to Unequip|<&e>Current<&co> <&a><script.parsed_key[data.<[type]>.display_name]>"
        - define remove_script <script.parsed_key[data.<[type]>.remove_task]>
        - define item <item[<[material]>].with[display=<[display]>;lore=<[lore]>;flag=run_script:<[remove_script]>;flag=page:<[page]>;flag=type:<[type]>]>
      - else:
        - if <[type]> == plushies:
          - define item "bone_meal[display=<&e>No Cosmetic Equipped;flag=run_script:cancel;flag=page:<[page]>;flag=type:<[type]>;custom_model_data=10000]"
        - else:
          - define item "barrier[display=<&e>No Cosmetic Equipped;flag=run_script:cancel;flag=page:<[page]>;flag=type:<[type]>]"
      - inventory set slot:<script.data_key[data.slot_data.remove_slot]> o:<[item]> d:<[inventory]>

    # Next Page Button
    - if <[cosmetics].size> > <[end]>:
      - inventory set slot:<script.data_key[data.slot_data.next_page]> o:<item[leather_horse_armor].with[hides=all;display_name=<&a>Next<&sp>Page;flag=run_script:cosmetics_next_page;color=green;custom_model_data=7]> d:<[inventory]>

    # Previous Page Button
    - if <[page]> != 1:
      - inventory set slot:<script.data_key[data.slot_data.previous_page]> o:<item[leather_horse_armor].with[hides=all;display_name=<&a>Previous<&sp>Page;flag=run_script:cosmetics_previous_page;color=green;custom_model_data=6]> d:<[inventory]>

    # Back to Cosmetics
    - if !<[entity].exists>:
      - inventory set slot:<script.data_key[data.slot_data.back]> o:<item[feather].with[hides=all;display_name=<&a>Back<&sp>To<&sp>Cosmetics;flag=run_script:cosmetic_main_menu_open;custom_model_data=3]> d:<[inventory]>
    # Plushy Display Location Flag and Pickup Button
    - if <[entity].exists>:
      - flag <player> current_plushy_display_entity:<[entity]> expire:1d
      - inventory set slot:<script.data_key[data.slot_data.plushy_pickup]> o:plushy_display_remove_item d:<[inventory]>
    # Open The Inventory
    - inventory open d:<[inventory]>
