custom_durability_block_breaking:
  type: world
  debug: false
  events:
    on player breaks block with:copper_axe|copper_pickaxe|copper_shovel|copper_sword|copper_hoe|copper_shears|:
      - define slot <player.held_item_slot>
      - choose <player.item_in_hand.script.name.after[_]>:
        - case axe pickaxe shovel hoe shears:
          - define value 1
        - case sword:
          - define value 2
      - inject custom_durability_process_task

    on player damages entity with:copper_axe|copper_pickaxe|copper_shovel|copper_sword|copper_hoe|copper_shears|:
      - define slot <player.held_item_slot>
      - choose <player.item_in_hand.script.name.after[_]>:
        - case axe pickaxe shovel:
          - define value 2
        - case hoe sword:
          - define value 1
        - case shears:
          - define value 0
      - inject custom_durability_process_task

    on player right clicks dirt with:copper_hoe:
      - narrate <context.hand>
      - define slot <player.held_item_slot>
      - if <context.hand> == offhand:
        - define slot 41
      - define value 1
      - inject custom_durability_process_task

    on player right clicks *_log|stem with:copper_axe:
      - define slot <player.held_item_slot>
      - if <context.hand> == offhand:
        - define slot 41
      - if <context.location.material.name.contains[stripped]>:
        - stop
      - define value 1
      - inject custom_durability_process_task

custom_durability_process_task:
  type: task
  debug: false
  script:
      - if <player.item_in_hand.flag[custom_durability.current].add[<[value]>]> < <player.item_in_hand.flag[custom_durability.max]>:
        - inventory flag slot:<player.held_item_slot> custom_durability.current:<player.item_in_hand.flag[custom_durability.current].add[<[value]>]>
        - define percent <player.item_in_hand.flag[custom_durability.current].div[<player.item_in_hand.flag[custom_durability.max]>]>
        - define current_dur <player.item_in_hand.material.max_durability.mul[<[percent]>]>
        - inventory adjust slot:<player.held_item_slot> durability:<[current_dur].round_up>
      - else:
        - take slot:<[slot]>
        - playsound sound:item_shield_break <player>
