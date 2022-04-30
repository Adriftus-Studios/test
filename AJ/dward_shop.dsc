dwarf_shop_events:
  type: world
  debug: false
  data:
    shop:
      rotating:
        # Item scripts or materials that should be sold
        items:
          diamond:
            quantity: 5
            price:
              rock_spirit_item: 64
        # Slots that rotating items should be in
        slots:
        - 38
        - 39
        - 40
        - 41
        - 42
        - 43
        - 44
      constant:
      # Slot
        11:
          # Item being sold
          item: diamond
          # How many rock spirits
          price:
            rock_spirit_item: 10
  reload:
  - note remove as:dwarf_shop
  - note <inventory[dwarf_shop_inventory]> as:dwarf_shop
  - define inv <inventory[dwarf_shop]>
  - foreach <script.data_key[data.shop.constant].keys> as:slot:
    - define item <script.data_key[data.shop.constant.<[slot]>.item].as_item||null>
    - foreach next if:<[item].equals[null]>
    - define lore <[item].lore||<list>>
    - define "lore:|:<n><&e>Price:"
    - foreach <script.data_key[data.shop.constant.<[slot]>.price].keys> as:price_item:
      - define price_quantity <script.data_key[data.shop.constant.<[slot]>.price.<[price_item]>]>
      - define price_item <[price_item].as_item>
      - define "lore:|:<&7> - <[price_quantity]> <[price_item].display||<[price_item].material.name>>"
    - define item <[item].with[lore=<[lore]>]>
    - inventory set d:<[inv]> slot:<[slot]> o:<[item]>
  - narrate targets:<server.online_players.filter[has_permission[admin]]> "<&e>Dwarf shop inventory <&6>Compiled"
  events:
    on player clicks in dwarf_shop_inventory:
    - stop if:<context.clicked_inventory.equals[<player.inventory>]>
    - stop if:<script.data_key[data.shop.constant].keys.include[<script.data_key[data.shop.rotating.slots]>].contains[<context.slot>].not>
    - if <script.data_key[data.shop.rotating.slots].contains[<context.slot>]>:
      - narrate ROTATING
    - else:
      - narrate CONSTANT
    on script reload:
    - inject <script.name> path:reload
    # TODO

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
    - stop if:<list[survival|adventure].contains[<player.gamemode>]>
    - define material <context.material.name>
    - stop if:<script.data_key[data.drop_chances].keys.contains[<[material]>].not>
    - define config <script.data_key[data.drop_chances.<[material]>]>
    - define list <element[no].repeat_as_list[<[config].get[total].sub[<[config].get[chance]>]>]>
    - define list <[list].include[<element[yes].repeat_as_list[<[config].get[chance]>]>]>
    - define outcome <[list].random>
    - if <[outcome]> == yes:
      - determine <context.location.drops[<player.item_in_hand>].include[<item[rock_spirit_item]>]>