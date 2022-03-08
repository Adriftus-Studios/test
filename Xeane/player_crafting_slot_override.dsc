player_crafting_slots_override_events:
  type: world
  debug: true
  data:
    items:
      - "crafting_table[display=<&e>Crafting Table;flag=run_script:player_crafting_slots_open_button;flag=script:open_crafting_grid]"
      - "stone[display=<&6>Adriftus Chest;flag=run_script:player_crafting_slots_open_button;flag=script:adriftus_chest_inventory_open]"
      - "piston[display=<&b>Menu;flag=run_script:player_crafting_slots_open_button;flag=script:main_menu_inventory_open]"
      - "feather[display=<&a>Travel;flag=run_script:player_crafting_slots_open_button;flag=script:travel_menu_open]"
    mailbox:
      true: "paper[display=<&a>Mailbox;flag=run_script:player_crafting_slots_open_button;flag=script:travel_menu_open]"
      false: "paper[display=<&a>Mailbox;flag=run_script:player_crafting_slots_open_button;flag=script:travel_menu_open]"
  set_inv:
      - define inv <player.open_inventory>
      - repeat 5:
        - inventory set slot:<[value]> o:air d:<[inv]>
      - wait 1t
      - foreach <script.data_key[data.items]>:
        - inventory set slot:<[loop_index].add[1]> o:<[value].parsed> d:<[inv]>
      - inventory set slot:1 o:<script.data_key[data.mailbox.true].parsed> d:<[inv]>
      - inventory update
  events:
    after player joins:
      - inject locally path:set_inv
    on player closes PLAYER:
      - inject locally path:set_inv

player_crafting_slots_open_button:
  type: task
  debug: false
  script:
    - if <context.raw_slot> == 1:
      - determine passively cancelled
    - else:
      - determine passively <item[air]>
      - adjust <player> item_on_cursor:<context.item>
    - define script <context.item.flag[script]>
    - wait 2t
    - inject <[script]>
    - wait 1t
    - run player_crafting_slots_override_events path:set_inv
