offhand_shulker:
  type: task
  debug: false
  script:
    on player picks up item:
      - if <player.item_in_offhand.inventory_contents.exists>:
        - define inv <inventory[offhand_shulker_dummy_inventory].with[contents=<player.item_in_offhand.inventory_contents>]>
        - if <[inv].can_fit[<context.item>]>:
          - give <context.item> to:<[inv]>
          - inventory adjust slot:offhand inventory_contents:<[inv].list_contents>
          - determine ITEM:air

offhand_shulker_dummy_inventory:
  type: inventory
  debug: false
  title: dummy
  size: 27
  inventory: chest