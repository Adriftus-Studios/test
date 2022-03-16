mail_letter_inventory:
  type: inventory
  inventory: chest
  title: <&a>Letter
  gui: true
  data:
    package_slots: 38|39|40|41|42|43|44
  slots:
    - [] [] [] [] [letter_info] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

mail_inventory_events:
  type: world
  debug: false
  events:
    on player clicks in mail_letter_inventory bukkit_priority:HIGHEST:
      - determine cancelled:false if:<list[<script.data_key[data.package_slots]>].contains[<context.slot>]>

mail_inventory_open:
  type: task
  debug: false
  definitions: page
  data:
    slot_data:
      slots_used: 11|12|13|14|15|16|17|20|21|22|23|24|25|26|29|30|31|32|33|34|35
      remove_slot: 50
      next_page: 45
      previous_page: 37
      back: 46
  script:
    # Define our initialization data
    - define page 1 if:<[page].exists.not>
    - define title "<&6>Adriftus Mail"
    - define slots <list[<script.data_key[data.slot_data.slots_used]>]>
    - define start <[page].sub[1].mul[<[slots].size>].add[1]>
    - define end <[slots].size.mul[<[page]>]>
    - define mail_id_list <yaml[global.player.<player.uuid>].list_keys[mail.letters]>

    # Build the cosmetic icons
    - foreach <[mail_id_list].get[<[start]>].to[<[end]>]> as:letter_id:
      - define material player_head[skin_blob=<yaml[global.player.<player.uuid>].read[mail.letters.<[letter_id]>.sender.skin_blob]>]
      - define display "<&e>Mail from <&b><yaml[global.player.<player.uuid>].read[mail.letters.<[letter_id]>.sender.name]>"
      - define description <script.parsed_key[data.<[type]>.description]> #TODO
      - define open_task <script.parsed_key[data.<[type]>.equip_task]> #TODO
      - define lore <script[cosmetic_configuration].parsed_key[display_data.lore]>
      - define items:|:<item[<[material]>].with[lore=<[lore]>;flag=run_script:<[open_task]>;flag=letter_id:<[letter_id]>]>
    - define inventory <inventory[generic[title=<[title]>;size=54]]>

    # Put the items into the new inventory
    - foreach <[items]>:
      - inventory set slot:<[slots].get[<[loop_index]>]> o:<[value].with[display=<&6>]> d:<[inventory]>

    # Build the "unequip cosmetic" item, and store pagination data on it
    - define material barrier
    - define display "<&e>Open All"
    - define lore "<&c>Delete all mail|<&e>Retrieves all contents"
    - define remove_script get_all_mail
    - define item <item[<[material]>[display=<[display]>;lore=<[lore]>;flag=run_script:<[remove_script]>;flag=page:<[page]>;flag=type:<[type]>]]>
    - inventory set slot:<script.data_key[data.slot_data.remove_slot]> o:<[item]> d:<[inventory]>

    # Next Page Button
    - if <[mail_id_list].size> > <[end]>:
      - inventory set slot:<script.data_key[data.slot_data.next_page]> o:<item[leather_horse_armor].with[hides=all;display_name=<&a>Next<&sp>Page;flag=run_script:cosmetics_next_page;color=green;custom_model_data=7]> d:<[inventory]>

    # Previous Page Button
    - if <[page]> != 1:
      - inventory set slot:<script.data_key[data.slot_data.previous_page]> o:<item[leather_horse_armor].with[hides=all;display_name=<&a>Previous<&sp>Page;flag=run_script:cosmetics_previous_page;color=green;custom_model_data=6]> d:<[inventory]>

    # Back to Main Menu
    - inventory set slot:<script.data_key[data.slot_data.back]> o:<item[leather_horse_armor].with[hides=all;display_name=<&a>Back<&sp>To<&sp>Cosmetics;flag=run_script:cosmetic_main_menu_open;color=red;custom_model_data=6]> d:<[inventory]>
    # Open The Inventory
    - inventory open d:<[inventory]>