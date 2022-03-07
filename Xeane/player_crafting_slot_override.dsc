player_crafting_slots_override_events:
  type: world
  debug: false
  data:
    items:
      - "stone[display=<&a>Crafting;flag=run_script:player_crafting_slots_open_crafting]"
      - "stone[display=<&a>Crafting;flag=run_script:player_crafting_slots_open_crafting]"
      - "stone[display=<&a>Crafting;flag=run_script:player_crafting_slots_open_crafting]"
      - "stone[display=<&a>Crafting;flag=run_script:player_crafting_slots_open_crafting]"
    result: "stone[display=<&a>Crafting;flag=run_script:player_crafting_slots_open_crafting]"
  events:
    on player clicks in PLAYER bukkit_priority:HIGH:
      - if <context.raw_slot> < 6:
        - determine cancelled
    on player closes PLAYER:
      - define inv <player.open_inventory>
      - repeat 5:
        - inventory set slot:<[value]> o:air d:<[inv]>
      - wait 1t
      - foreach <script.data_key[data.items]>:
        - inventory set slot:<[loop_index].add[1]> o:<[value].parsed> d:<[inv]>
      - inventory set slot:1 o:<script.data_key[data.result].parsed> d:<[inv]>

player_crafting_slots_open_crafting:
  type: task
  debug: false
  script:
    - determine passively <item[air]>
    - adjust <player> item_on_cursor:<context.item>
    - wait 1t
    - inventory open d:workbench