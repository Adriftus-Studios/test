offhand_shulker:
  type: task
  debug: false
  script:
    on player picks up item:
      - if <player.item_in_offhand.inventory.exists> && <player.item_in_offhand.inventory.can_fit[<context.item>]>:
        - give <context.item> to:<player.item_in_offhand.inventory>
        - determine ITEM:air
