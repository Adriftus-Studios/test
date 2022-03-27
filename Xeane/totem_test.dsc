totem_test:
  type: task
  debug: false
  script:
    - define item <player.item_in_hand>
    - inventory set slot:<player.held_item_slot> o:totem_of_undying[custom_model_data=1]
    - animate <player> animation:TOTEM_RESURRECT for:<player>
    - inventory set slot:<player.held_item_slot> o:<[item]>