player_crafting_slots_override_events:
  type: world
  debug: true
  data:
    items:
      - "stone[display=<&e>Crafting;flag=run_script:player_crafting_slots_open_crafting]"
      - "stone[display=<&6>Adriftus Chest;flag=run_script:player_crafting_slots_open_crafting]"
      - "stone[display=<&b>Menu;flag=run_script:player_crafting_slots_open_crafting]"
      - "stone[display=<&a>Wallet;flag=run_script:player_crafting_slots_open_crafting]"
  events:
    on player clicks in PLAYER bukkit_priority:HIGH:
        - determine cancelled if:<context.raw_slot.equals[1]>

    on player joins:
      - inventory open d:<player.inventory>
      - wait 1t
      - inventory close

    on player closes PLAYER:
      - define inv <player.open_inventory>
      - if <[inv].slot[6].exists>:
        - stop
      - repeat 5:
        - inventory set slot:<[value]> o:air d:<[inv]>
      - wait 1t
      - foreach <script.data_key[data.items]>:
        - inventory set slot:<[loop_index].add[1]> o:<[value].parsed> d:<[inv]>
      - inventory set slot:1 o:air d:<[inv]>

player_crafting_slots_open_crafting:
  type: task
  debug: false
  script:
    - determine passively <item[air]>
    - adjust <player> item_on_cursor:<context.item>
    - wait 1t
    - inventory open d:workbench