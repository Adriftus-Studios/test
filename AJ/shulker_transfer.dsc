
easy_shulker_transfer:
  type: world
  debug: false
  events:
    on player right clicks block:
    # shulker to chest
    - stop if:<player.item_in_hand.material.name.ends_with[shulker_box].not.if_null[true]>
    - stop if:<context.location.material.name.ends_with[chest].not.if_null[true]>
    - determine passively cancelled
    - define inventory <context.location.inventory>
    - if <player.item_in_hand.script.name.equals[big_shulker_item].not.if_null[true]>:
      - define items <player.item_in_hand.inventory_contents>
      - if <[inventory].can_fit[<[items]>]>:
        - inventory adjust d:<player.inventory> slot:<player.held_item_slot> inventory_contents:<list[]>
        - inventory swap d:<context.location.inventory> o:<context.location.inventory.include[<[items]>]>
        - narrate "<&e>Items transferred successfully. 1"
        - stop
      - else:
        - while <[items].is_empty.not>:
          - define i <[items].get[1]>
          - if <[inventory].can_fit[<[i]>]>:
            - define inventory <[inventory].include[<[i]>]>
            - define items <[items].remove[1]>
          - else:
            - inventory adjust d:<player.inventory> slot:<player.held_item_slot> inventory_contents:<[items]>
            - inventory swap d:<context.location.inventory> o:<[inventory]>
            - narrate "<&e>Items transferred successfully. 2"
            - stop
    - else:
      - stop if:<player.item_in_hand.has_flag[big_shulker].not>
      - define items <player.item_in_hand.flag[big_shulker]>
      - if <[inventory].can_fit[<[items]>]>:
        - inventory flag d:<player.inventory> slot:<player.held_item_slot> big_shulker:<list[]>
        - inventory swap d:<context.location.inventory> o:<context.location.inventory.include[<[items]>]>
        - narrate "<&e>Items transferred successfully. 3"
        - stop
      - else:
        - while <[items].is_empty.not>:
          - define i <[items].get[1]>
          - if <[inventory].can_fit[<[i]>]>:
            - define inventory <[inventory].include[<[i]>]>
            - define items <[items].remove[1]>
          - else:
            - inventory flag d:<player.inventory> slot:<player.held_item_slot> big_shulker:<[items]>
            - inventory swap d:<context.location.inventory> o:<[inventory]>
            - narrate "<&e>Items transferred successfully. 4"
            - stop
    on player left clicks block:
    # chest to shulker
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
