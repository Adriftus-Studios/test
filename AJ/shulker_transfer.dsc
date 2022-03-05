
easy_shulker_transfer:
  type: world
  debug: false
  events:
    on player right clicks block:
    # shulker to chest
    - stop if:<player.item_in_hand.material.name.ends_with[shulker_box].not.if_null[true]>
    - stop if:<context.location.material.name.ends_with[chest].not.if_null[true]>
    - determine passively cancelled
    - define size <context.location.inventory.size>
    - if <player.item_in_hand.script.name.equals[big_shulker_item].not.if_null[true]>:
      - define inventory <player.item_in_hand.inventory_contents>
      - define items <context.location.inventory.list_contents.filter[material.name.ends_with[shulker_box].not]>
    - else:
      - define inventory <player.item_in_hand.flag[big_shulker]||<list[]>>
      - define items <context.location.inventory.list_contents.filter[material.name.ends_with[shulker_box].not]>
    - define chest_items <context.location.inventory.list_contents>
    - define shulker_items <[inventory]>
    - while <[shulker_items].size> != 0:
      - define i <[shulker_items].get[1]>
      - if <[chest_items].include[<[i]>].size> > <[size]>:
        - while stop
      - else:
        - define chest_items <[chest_items].include[<[i]>]>
        - define shulker_items <[shulker_items].remove[1]>
    - if <player.item_in_hand.script.name.equals[big_shulker_item].not.if_null[true]>:
      - inventory adjust d:<player.inventory> slot:<player.held_item_slot> inventory_contents:<[shulker_items]>
    - else:
      - inventory flag d:<player.inventory> slot:<player.held_item_slot> big_shulker:<[shulker_items]>
    - adjust <context.location.inventory> contents:<[chest_items]>
    - narrate "<&e>Items transferred."

    on player left clicks block:
    # chest to shulker
    - stop if:<player.item_in_hand.material.name.ends_with[shulker_box].not.if_null[true]>
    - stop if:<context.location.material.name.ends_with[chest].not.if_null[true]>
    - determine passively cancelled
    - if <player.item_in_hand.script.name.equals[big_shulker_item].not.if_null[true]>:
      - define inventory <player.item_in_hand.inventory_contents>
      - define size 27
    - else:
      - define inventory <player.item_in_hand.flag[big_shulker]||<list[]>>
      - define size 54
    - define chest_items <[inventory]>
    - define shulker_items <context.location.inventory.list_contents>
    - while <[shulker_items].size> != 0:
      - define i <[shulker_items].get[1]>
      - narrate <[loop_index]>
      - if <[chest_items].include[<[i]>].size> > <[size]>:
        - while stop
      - else:
        - define chest_items <[chest_items].include[<[i]>]>
        - define shulker_items <[shulker_items].remove[1]>
    - narrate <[shulker_items].size>
    - narrate <[chest_items].size>
    - if <player.item_in_hand.script.name.equals[big_shulker_item].not.if_null[true]>:
      - inventory adjust d:<player.inventory> slot:<player.held_item_slot> inventory_contents:<[chest_items]>
    - else:
      - inventory flag d:<player.inventory> slot:<player.held_item_slot> big_shulker:<[chest_items]>
    - adjust <context.location.inventory> contents:<[shulker_items]>
