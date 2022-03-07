
easy_shulker_transfer:
  type: world
  debug: false
  events:
    on player right clicks chest bukkit_priority:highest:
    - stop if:<player.item_in_hand.material.name.ends_with[shulker_box].not.if_null[true]>
    - stop if:<context.location.material.name.ends_with[chest].not.if_null[true]>
    - stop if:<context.cancelled>
    - determine passively cancelled
    - if !<player.has_flag[shulker_transfer.notify]>:
      - narrate "<&e>To change modes, Shift click a chest with a shulker box." expire:1d
      - flag <player> shulker_transfer.notify
    - if <player.is_sneaking>:
      - define mode <player.flag[shulker_transfer.mode].if_null[shulker_to_chest]>
      - choose <[mode]>:
        - case shulker_to_chest:
          - actionbar targets:<player> "<&e><&l>Transferring items from chest to shulker box."
          - flag <player> shulker_transfer.mode:chest_to_shulker
        - case chest_to_shulker:
          - actionbar targets:<player> "<&e><&l>Transferring items from shulker box to chest."
          - flag <player> shulker_transfer.mode:shulker_to_chest
    - else:
      - flag <player> shulker_transfer.mode:shulker_to_chest if:<player.has_flag[shulker_transfer.mode].not>
      - if <player.flag[shulker_transfer.mode]> == shulker_to_chest:
        - define size <context.location.inventory.size>
        - if <player.item_in_hand.script.name.equals[big_shulker_item].not.if_null[true]>:
          - define inventory <player.item_in_hand.inventory_contents>
          - define items <context.location.inventory.list_contents.filter[material.name.ends_with[shulker_box].not]>
        - else:
          - define inventory <player.item_in_hand.flag[big_shulker]||<list[]>>
          - define items <context.location.inventory.list_contents.filter[material.name.ends_with[shulker_box].not]>
        - define chest_items <context.location.inventory.list_contents>
        - define before <[chest_items].size>
        - define shulker_items <[inventory]>
        - while <[shulker_items].size> != 0:
          - define i <[shulker_items].get[1]>
          - if <[chest_items].include[<[i]>].size> > <[size]>:
            - while stop
          - else:
            - define chest_items <[chest_items].include[<[i]>]>
            - define shulker_items <[shulker_items].remove[1]>
        - define after <[chest_items].size>
        - if <player.item_in_hand.script.name.equals[big_shulker_item].not.if_null[true]>:
          - inventory adjust d:<player.inventory> slot:<player.held_item_slot> inventory_contents:<[shulker_items]>
        - else:
          - inventory flag d:<player.inventory> slot:<player.held_item_slot> big_shulker:<[shulker_items]>
        - adjust <context.location.inventory> contents:<[chest_items]>
        - inventory set d:<player.inventory> slot:<player.held_item_slot> o:<player.item_in_hand.proc[big_shulker_build_lore]>
        - narrate "<&e>Transferred <[after].sub[<[before]>]> stacks of items."
      - else if <player.flag[shulker_transfer.mode]> == chest_to_shulker:
        - if <player.item_in_hand.script.name.equals[big_shulker_item].not.if_null[true]>:
          - define inventory <player.item_in_hand.inventory_contents>
          - define size 27
        - else:
          - define inventory <player.item_in_hand.flag[big_shulker]||<list[]>>
          - define size 54
        - define shulker_items <[inventory]>
        - define before <[shulker_items].size>
        - define chest_items <context.location.inventory.list_contents.filter[material.name.ends_with[shulker_box].not]>
        - while <[chest_items].size> != 0:
          - define i <[chest_items].get[1]>
          - if <[shulker_items].include[<[i]>].size> > <[size]>:
            - while stop
          - else:
            - define shulker_items <[shulker_items].include[<[i]>]>
            - define chest_items <[chest_items].remove[1]>
        - define after <[shulker_items].size>
        - if <player.item_in_hand.script.name.equals[big_shulker_item].not.if_null[true]>:
          - inventory adjust d:<player.inventory> slot:<player.held_item_slot> inventory_contents:<[shulker_items]>
        - else:
          - inventory flag d:<player.inventory> slot:<player.held_item_slot> big_shulker:<[shulker_items]>
        - adjust <context.location.inventory> contents:<[chest_items].include[<context.location.inventory.list_contents.filter[material.name.ends_with[shulker_box]]>]>
        - inventory set d:<player.inventory> slot:<player.held_item_slot> o:<player.item_in_hand.proc[big_shulker_build_lore]>
        - narrate "<&e>Transferred <[after].sub[<[before]>]> stacks of items."