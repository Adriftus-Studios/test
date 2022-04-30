dwarf_shop_events:
  type: world
  debug: false
  data:
    shop:
      rotating:
        items:
        - TODO
        slots:
        - TODO
      constant:
      # Slot
        1:
          # Item being sold
          item: diamond
          # How many rock spirits
          price: 10
  events:
    on player clicks in dwarf_shop_inventory:
    - stop if:<context.clicked_inventory.equals[<player.inventory>]>
    - stop if:<script.data_key[data.shop.constant].keys.include[<script.data_key[data.shop.rotating.slots]>].contains[<context.slot>].not>
    - narrate <context.slot>

dwarf_shop_inventory:
  type: inventory
  inventory: chest
  size: 54
  gui: true
  slots:
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []

rock_spirit_item:
  type: item
  material: stone
  display name: <&e>Rock Spirit

rock_spirit_events:
  type: world
  debug: false
  data:
    drop_chances:
    # Material
      stone:
      # chance is 3 out of 10
        chance: 3
        total: 10
  events:
    on player breaks block:
    - define material <context.material.name>
    - stop if:<script.data_key[data.drop_chances].keys.contains[<[material]>].not>
    - define config <script.data_key[data.drop_chances.<[material]>]>
    - define list <element[no].repeat_as_list[<[config].get[total].sub[<[config].get[chance]>]>]>
    - define list <[list].include[<element[yes].repeat_as_list[<[config].get[chance]>]>]>
    - define outcome <[list].random>
    - if <[outcome]> == yes:
      - determine <context.location.drops[<player.item_in_hand>].include[<item[rock_spirit_item]>]>