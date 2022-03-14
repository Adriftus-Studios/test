cosmetic_configuration:
  type: data
  display_data:
    lore:
    - "<&b><&m>---<&r><&8><&m>｜-<&r>  <&8><&m>+--------------------------+<&r>  <&8><&m>-｜<&b><&m>---"
    - "<&7>* <&e>Name: <&7><[display]>"
    - "<&7>* <[preview]>"
    - "<&7>* <&e>Description: <&7><[description]>"
    - "<&r>"
    - "<&7>* Want more cool cosmetics? let us know!"
    - "<&7>  Buy more cosmetics, available at the shops!"
    - "<&r>"
    - "<&a>Click to use this cosmetic."
    - "<&b><&m>---<&r><&8><&m>｜-<&r>  <&8><&m>+--------------------------+<&r>  <&8><&m>-｜<&b><&m>---"
    - "<&r>"

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
      description: <server.flag[masks.ids.<[cosmetic]>].parsed_key[display_data.description]>
      preview: "<&e>Disguised Name<&co> <&r><server.flag[masks.ids.<[cosmetic]>].parsed_key[mask_data.display_name]>"
      current: <yaml[global.player.<player.uuid>].read[masks.current.id].if_null[default]>
      equip_task: mask_wear
      remove_task: mask_remove
    titles:
      inventory_title: <&e>Titles
      players_list: <yaml[global.player.<player.uuid>].list_keys[titles.unlocked]>
      material: name_tag
      display_name: <[cosmetic]>
      preview: "<&e>Preview<&co> <&r><yaml[titles].parsed_key[titles.<[cosmetic]>.tag].parse_color>"
      description: <yaml[titles].parsed_key[titles.<[cosmetic]>.description].parse_color>
      current: <yaml[global.player.<player.uuid>].read[titles.current].if_null[default]>
      equip_task: titles_equip
      remove_task: titles_remove
    bowtrails:
      inventory_title: <&e>Bowtrails
      players_list: <yaml[global.player.<player.uuid>].list_keys[bowtrails.unlocked]>
      material: <yaml[bowtrails].read[bowtrails.<[cosmetic]>.icon]>
      display_name: <yaml[bowtrails].parsed_key[bowtrails.<[cosmetic]>.name].parse_color>
      preview: "<&e>Trail Type<&co> <&r><yaml[bowtrails].parsed_key[bowtrails.<[cosmetic]>.type]>"
      description: <yaml[bowtrails].parsed_key[bowtrails.<[cosmetic]>.description].parse_color>
      current: <yaml[global.player.<player.uuid>].read[bowtrails.current].if_null[default]>
      equip_task: bowtrails_equip
      remove_task: bowtrails_remove
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
      - define preview <script.parsed_key[data.<[type]>.preview]>
      - define description <script.parsed_key[data.<[type]>.description]>
      - define equip_script <script.parsed_key[data.<[type]>.equip_task]>
      - define lore <script[cosmetic_configuration].parsed_key[display_data.lore]>
      - define items:|:<item[<[material]>].with[lore=<[lore]>;flag=run_script:<[equip_script]>;flag=cosmetic:<[cosmetic]>]>
    - define inventory <inventory[generic[title=<[title]>;size=54]]>

    # Put the items into the new inventory
    - foreach <[items]>:
      - inventory set slot:<[slots].get[<[loop_index]>]> o:<[value].with[display=<&6>]> d:<[inventory]>

    # Build the "unequip cosmetic" item, and store pagination data on it
    - define cosmetic <script.parsed_key[data.<[type]>.current]>
    - if <[cosmetic]> != default:
      - define material <script.parsed_key[data.<[type]>.material]>
      - define display "<&e>Unequip Cosmetic"
      - define lore "<&e>Left Click to Unequip|<&e>Current<&co> <script.parsed_key[data.<[type]>.preview]>"
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