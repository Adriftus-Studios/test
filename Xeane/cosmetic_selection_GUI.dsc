cosmetic_selection_inventory_open:
  type: task
  debug: false
  definitions: type|page
  data:
    slots_used: 11|12|13|14|15|16|17|20|21|22|23|24|25|26|29|30|31|32|33|34|35|38|39|40|41|42|43|44
    remove_slot: 50
    next_page: 54
    previous_page: 46
    masks:
      inventory_title: <&d>Masks
      players_list: <yaml[global.player.<player.uuid>].list_keys[masks.unlocked]>
      material: <server.flag[masks.ids.<[cosmetic]>].data_key[display_data.material]>
      display_name: <server.flag[masks.ids.<[cosmetic]>].parsed_key[display_data.display_name]>
      lore: <server.flag[masks.ids.<[cosmetic]>].parsed_key[display_data.lore]>
      current: <yaml[global.player.<player.uuid>].read[masks.current.id].if_null[default]>
      equip_task: mask_wear
      remove_task: mask_remove
    titles:
      inventory_title: <&e>Titles
      players_list: <yaml[global.player.<player.uuid>].list_keys[titles.unlocked]>
      material: <yaml[titles].parsed_key[gui.tag_select_item.material]>
      display_name: <yaml[titles].parsed_key[gui.tag_select_item.displayname].parse_color>
      lore: <yaml[titles].data_key[gui.tag_select_item.lore].parse[parse_color.parsed]>
      current: <yaml[global.player.<player.uuid>].read[titles.current].if_null[default]>
      equip_task: titles_equip
      remove_task: titles_remove
  script:
    # Sanity Check
    - if !<[type].exists>:
      - debug error "Something tried opening the cosmetic selection without a TYPE specified."
      - stop

    # Define our initialization data
    - define page 1 if:<[page].exists.not>
    - define title <script.parsed_key[data.<[type]>.inventory_title]>
    - define slots <list[<script.data_key[data.slots_used]>]>
    - define start <[page].sub[1].mul[<[slots].size>].add[1]>
    - define end <[slots].size.mul[<[page]>]>
    - define cosmetics <script.parsed_key[data.<[type]>.players_list]>

    # Build the cosmetic icons
    - foreach <[cosmetics].get[<[start]>].to[<[end]>]> as:cosmetic:
      - define material <script.parsed_key[data.<[type]>.material]>
      - define display <script.parsed_key[data.<[type]>.display_name]>
      - define lore <script.parsed_key[data.<[type]>.lore]>
      - define equip_script <script.parsed_key[data.<[type]>.equip_task]>
      - define items:|:<item[<[material]>[display=<[display]>;lore=<[lore]>;flag=run_script:<[equip_script]>;flag=cosmetic:<[cosmetic]>]]>
    - define inventory <inventory[generic[title=<[title]>;size=54]]>

    # Put the items into the new inventory
    - foreach <[items]>:
      - inventory set slot:<[slots].get[<[loop_index]>]> o:<[value]> d:<[inventory]>

    # Build the "unequip cosmetic" item, and store pagination data on it
    - define cosmetic <script.parsed_key[data.<[type]>.current]>
    - if <[cosmetic]> != default:
      - define material <script.parsed_key[data.<[type]>.material]>
      - define display "<&e>Unequip Cosmetic"
      - define lore "<&e>Left Click to Unequip|<&e>Current<&co> <script.parsed_key[data.<[type]>.display_name]>"
      - define remove_script <script.parsed_key[data.<[type]>.remove_task]>
      - define item <item[<[material]>[display=<[display]>;lore=<[lore]>;flag=run_script:<[remove_script]>;flag=page:<[page]>;flag=type:<[type]>]]>
    - else:
      - define item "barrier[display=<&e>No Cosmetic Equipped;flag=run_script:cancel]"
    - inventory set slot:<script.data_key[data.remove_slot]> o:<[item]> d:<[inventory]>

    # Next Page Button
    - if <[cosmetics].size> > <[end]>:
      - inventory set:<script.data_key[data.next_page]> o:<item[leather_horse_armor].with[display_name=<&a>Next<&sp>Page;flag=run_script:cosmetics_next_page;color=green;custom_model_data=7]>

    # Previous Page Button
    - if <[page]> != 1:
      - inventory set:<script.data_key[data.previous_page]> o:<item[leather_horse_armor].with[display_name=<&a>Previous<&sp>Page;flag=run_script:cosmetics_previous_page;color=green;custom_model_data=6]>

    # Open The Inventory
    - inventory open d:<[inventory]>

cosmetics_next_page:
  type: task
  debug: false
  script:
    - define info_item <context.inventory.slot[<script[cosmetic_selection_inventory_open].data_key[data.remove_slot]>]>
    - run cosmetic_selection_inventory_open def:<[info_item].flag[type]>|<[info_item].flag[page].add[1]>

cosmetics_previous_page:
  type: task
  debug: false
  script:
    - define info_item <context.inventory.slot[<script[cosmetic_selection_inventory_open].data_key[data.remove_slot]>]>
    - run cosmetic_selection_inventory_open def:<[info_item].flag[type]>|<[info_item].flag[page].sub[1]>