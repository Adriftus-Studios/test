player_crafting_slots_override_events:
  type: world
  debug: false
  data:
    items:
      - "stone[display=<&a>Crafting;flag=run_script:open_crafting_grid;flag=cancelled:true]"
      - "stone[display=<&a>Crafting;flag=run_script:open_crafting_grid;flag=cancelled:true]"
      - "stone[display=<&a>Crafting;flag=run_script:open_crafting_grid;flag=cancelled:true]"
      - "stone[display=<&a>Crafting;flag=run_script:open_crafting_grid;flag=cancelled:true]"
  events:
    on player closes PLAYER:
      - define inv <player.open_inventory>
      - repeat 5:
        - inventory set slot:<[value]> o:air d:<[inv]>
      - wait 1t
      - foreach <script.data_key[data.items]>:
        - inventory set slot:<[loop_index]> o:<[value]> d:<[inv]>