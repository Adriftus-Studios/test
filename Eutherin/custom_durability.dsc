custom_durability_block_breaking:
  type: world
  debug: false
  events:
    on player breaks block with:copper_axe|copper_pickaxe|copper_shovel|copper_sword|copper_hoe|copper_shears|:
      - choose <player.item_in_hand.script.name.after[_]>:
        - case axe:
          - define value 1
        - case pickaxe:
          - define value 1
        - case shovel:
          - define value 1
        - case hoe:
          - define value 1
        - case sword:
          - define value 2
        - case shears:
          - define value 1
      - inject custom_durability_process_task

    on player damages entity with:copper_axe|copper_pickaxe|copper_shovel|copper_sword|copper_hoe|copper_shears|:
      - choose <player.item_in_hand.script.name.after[_]>:
        - case axe:
          - define value 2
        - case pickaxe:
          - define value 2
        - case shovel:
          - define value 2
        - case hoe:
          - define value 1
        - case sword:
          - define value 1
        - case shears:
          - define value 0
      - inject custom_durability_process_task

    on player right clicks dirt with:copper_hoe:
      - define value 1
      - inject custom_durability_process_task
    on player right clicks *_log|stem with:copper_axe:
      - if <context.location.material.name.contains[stripped]>:
        - stop
      - define value 1
      - inject custom_durability_process_task

custom_durability_process_task:
  type: task
  debug: false
  script:
      - if <player.item_in_hand.flag[custom_durability.max].sub[<player.item_in_hand.flag[custom_durability.current]>]> < <[value]>:
        - flag item custom_durability:<player.item_in_hand.flag[custom_durability.current].sub[<[value]>]>
        - define percent <player.item_in_hand.flag[custom_durability.current].div[<player.item_in_hand.flag[custom_durability.max]>]>
        - define current_dur <player.item_in_hand.material.max_durability.mul[<[percent]>]>
        - inventory adjust slot:<player.held_item_slot> durability:<[current_dur]>
      - else:
        - take iteminhand
        - playsound sound:item_shield_break <player>
