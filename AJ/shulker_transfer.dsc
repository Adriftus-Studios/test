
easy_shulker_transfer:
  type: world
  debug: false
  events:
    on player right clicks block:
    - stop if:<player.item_in_hand.material.name.ends_with[shulker_box].not>
    - stop if:<context.location.material.name.ends_with[chest].not>
    - determine passively cancelled
    - define inventory <context.location.inventory>
    - if <player.item_in_hand.script.name.equals[big_shulker_item].not.if_null[true]>:
      - define items <player.item_in_hand.inventory.list_contents>
      - if <[inventory].can_fit[<[items]>]>:
        - inventory adjust d:<player.inventory> slot:<player.held_item_slot> inventory_contents:<list[]>
        - inventory swap d:<context.location.inventory> o:<context.location.inventory.include[<[items]>]>
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
            - stop
    - else:
      - stop if:<player.item_in_hand.has_flag[big_shulker].not>
      - define items <player.item_in_hand.flag[big_shulker]>
      - if <[inventory].can_fit[<[items]>]>:
        - inventory adjust d:<player.inventory> slot:<player.held_item_slot> inventory_contents:<list[]>
        - inventory swap d:<context.location.inventory> o:<context.location.inventory.include[<[items]>]>
        - stop
      - else:
        - narrate t
        - while <[items].is_empty.not>:
          - define i <[items].get[1]>
          - if <[inventory].can_fit[<[i]>]>:
            - define inventory <[inventory].include[<[i]>]>
            - define items <[items].remove[1]>
          - else:
            - inventory flag d:<player.inventory> slot:<player.held_item_slot> big_shulker:<[items]>
            - inventory swap d:<context.location.inventory> o:<[inventory]>
            - stop