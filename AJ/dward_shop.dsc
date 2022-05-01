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
              rock_spore_item: 64
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
            rock_spore_item: 10
  reload:
  - note remove as:dwarf_shop
  - note <inventory[dwarf_shop_inventory]> as:dwarf_shop
  - define inv <inventory[dwarf_shop]>
  - foreach <script.data_key[data.shop.constant].keys> as:slot:
    - define item <script.data_key[data.shop.constant.<[slot]>.item].as_item||null>
    - define quantity <script.data_key[data.shop.constant.<[slot]>.quantity].if_null[1]>
    - define item <[item].with_flag[dwarf_shop_item.item:<[item]>].with_flag[dwarf_shop_item.quantity:<[quantity]>].with[quantity=<[quantity]>]>
    - foreach next if:<[item].equals[null]>
    - define lore <[item].lore||<list>>
    - define "lore:|:<n><&e>Price:"
    - foreach <script.data_key[data.shop.constant.<[slot]>.price].keys> as:price_item:
      - define price_quantity <script.data_key[data.shop.constant.<[slot]>.price.<[price_item]>]>
      - define item <[item].with_flag[price.<[price_item]>:<[price_quantity]>]>
      - define price_item <[price_item].as_item>
      - define "lore:|:<&7> - <[price_quantity]> <[price_item].display||<[price_item].material.name>>"
    - define item <[item].with[lore=<[lore]>]>
    - inventory set d:<[inv]> slot:<[slot]> o:<[item]>
  - foreach <script.data_key[data.shop.rotating.slots]> as:slot:
    - define items <script.data_key[data.shop.rotating.items].keys.filter[as_item.is_truthy]>
    - define slots <script.data_key[data.shop.rotating.slots]>
    - define items <[items].random[<[slots].size>]>
    - define i 0
    - foreach <[items]> as:item:
      - define i <[i].add[1]>
      - define slot <[slots].get[<[i]>]>
      - define quantity <script.data_key[data.shop.rotating.items.<[item]>.quantity].if_null[1]>
      - define item <[item].as_item.with[quantity=<[quantity]>]>
      - define price <script.data_key[data.shop.rotating.items.<[item]>.price]>
      - define lore <[item].lore||<list>>
      - define "lore:|:<n><&e>Price:"
      - foreach <[price].keys> as:price_item:
        - define price_quantity <script.data_key[data.shop.rotating.items.<[item]>.price.<[price_item]>]>
        - define item <[item].with_flag[price.<[price_item]>:<[price_quantity]>]>
        - define price_item <[price_item].as_item>
        - define "lore:|:<&7> - <[price_quantity]> <[price_item].display||<[price_item].material.name>>"
      - inventory set d:<[inv]> slot:<[slot]> o:<[item].with_flag[dwarf_shop_item.item:<[item].as_item>].with_flag[dwarf_shop_item.quantity:<[quantity]>].with[lore=<[lore]>]>
  - narrate targets:<server.online_players.filter[has_permission[admin]]> "<&e>Dwarf shop inventory <&6>Compiled"
  events:
    on player right clicks cow:
    - stop if:<context.entity.mythicmob.internal_name.equals[DwarfSmith].not>
    - inventory open d:<inventory[dwarf_shop]>
    on player clicks in dwarf_shop_inventory:
    - stop if:<context.item.has_flag[dwarf_shop_item].not>
    - define missing <map>
    - foreach <context.item.flag[price].keys> as:price_item:
      - define price_quantity <context.item.flag[price.<[price_item]>]>
      - define missing <[missing].with[<[price_item]>].as[<[price_quantity]>]> if:<player.inventory.quantity_item[<[price_item]>].is_less_than[<[price_quantity]>]>
    - if <[missing].is_empty.not>:
      - narrate "You are missing items."
      - stop
    - foreach <context.item.flag[price].keys> as:price_item:
      - define price_quantity <context.item.flag[price.<[price_item]>]>
      - take from:<player.inventory> item:<[price_item]> quantity:<[price_quantity]>
    - give to:<player.inventory> <context.item.flag[dwarf_shop_item.item].as_item> quantity:<context.item.flag[dwarf_shop_item.quantity]>
    on script reload:
    - inject <script[dwarf_shop_events].name> path:reload

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

rock_spore_item:
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
      - determine <context.location.drops[<player.item_in_hand>].include[<item[rock_spore_item]>]>