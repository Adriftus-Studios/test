custom_durability_block_breaking:
  type: world
  debug: false
  events:
    on player breaks block with:copper_axe|copper_pickaxe|copper_shovel|copper_sword|copper_hoe|copper_shears|:
      - choose <context.item.script.name.after[_]>:
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
      - choose <context.item.script.name.after[_]>:
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
      - if <context.item.flag[custom_durability_max].sub[<context.item.flag[custom_durability_current]>]> < <[value]>:
        - flag item custom_durability:<context.item.flag[custom_durability_current].sub[<[value]>]>
        - define percent <context.item.flag[custom_durability_current].div[<context.item.flag[custom_durability_max]>]>
        - define current_dur <context.item.material.max_durability.mul[<[percent]>]>
        - inventory adjust slot:<player.held_item_slot> durability:<[current_dur]>
      - else:
        - take iteminhand
        - playsound sound:item_shield_break <player>
