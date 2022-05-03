custom_durability_process_task:
  type: task
  debug: false
  script:
      - stop if:!<player.inventory.slot[<[slot]>].has_flag[custom_durability.max]>:
      - if <player.inventory.slot[<[slot]>].flag[custom_durability.current].add[<[value]>]> < <player.inventory.slot[<[slot]>].flag[custom_durability.max]>:
        - inventory flag slot:<[slot]> custom_durability.current:<player.item_in_hand.flag[custom_durability.current].add[<[value]>]>
        - define percent <player.item_in_hand.flag[custom_durability.current].div[<player.item_in_hand.flag[custom_durability.max]>]>
        - define current_dur <player.item_in_hand.material.max_durability.mul[<[percent]>]>
        - inventory adjust slot:<[slot]> durability:<[current_dur].round_up>
      - else:
        - take slot:<[slot]>
        - playsound sound:item_shield_break <player>
