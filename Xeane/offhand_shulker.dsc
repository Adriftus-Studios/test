offhand_shulker:
  type: world
  debug: true
  events:
    on player picks up item:
      - if <player.item_in_offhand.has_flag[offhand_shulker]>:
        - define inv <inventory[offhand_shulker_dummy_inventory]>
        - give <player.item_in_offhand.inventory_contents> to:<[inv]>
        - if <[inv].can_fit[<context.item>]>:
          - give <context.item> to:<[inv]>
          - inventory adjust slot:offhand inventory_contents:<[inv].list_contents>
          - remove <context.entity>
          - determine cancelled

offhand_shulker_dummy_inventory:
  type: inventory
  debug: false
  title: dummy
  size: 27
  inventory: chest