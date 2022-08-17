fishbot_barrel_handling:
  type: world
  debug: false
  events:
    on player clicks block location_flagged:fish_barrel:
      - determine passively cancelled
      - ratelimit <player> 2t
      - inventory open d:frank_catch_inventory_<player.flag[fishbot.barrel_expanded].if_null[0]>
    on player clicks item in frank_catch_inventory_*:
      - if <context.item.material.name> == air:
        - stop
      - if <context.raw_slot> < 55:
        - ratelimit <player> 5t
        - if <player.inventory.is_full>:
          - narrate "<&c>Please make some room in your inventory"
          - stop
        - take slot:<context.slot> from:<context.inventory>
        - give <context.item>
    on player closes frank_catch_inventory_*:
      - flag <player> fishbot.caught_items:<context.inventory.exclude_item[standard_filler].list_contents>


fish_barrel_expander_item:
  type: item
  material: feather
  debug: false
  display name: <&6>Fishing Barrel Expander
  lore:
  - <&e>Right Click<&6> to expand Franks Storage by <&e>9<&6> slots

fish_barrel_expansion_script:
  type: world
  debug: false
  events:
    on player right clicks block with:fish_barrel_expander_item:
      - determine passively cancelled
      - if <player.flag[fishbot.barrel_expanded].if_null[0]> < 3:
        - take iteminhand
        - flag <player> fishbot.barrel_expanded:++
      - else:
        - narrate "<&c>You have already used 3 fishing barrel expanders."

frank_catch_inventory_0:
  type: inventory
  inventory: chest
  title: Frank's Catch
  gui: true
  debug: false
  size: 54
  procedural items:
    - determine <player.flag[fishbot.caught_items]>
  slots:
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
  - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
  - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]

frank_catch_inventory_1:
  type: inventory
  inventory: chest
  title: Frank's Catch
  gui: true
  debug: false
  size: 54
  procedural items:
    - determine <player.flag[fishbot.caught_items]>
  slots:
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]
  - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]


frank_catch_inventory_2:
  type: inventory
  inventory: chest
  title: Frank's Catch
  gui: true
  debug: false
  size: 54
  procedural items:
    - determine <player.flag[fishbot.caught_items]>
  slots:
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler] [standard_filler]


frank_catch_inventory_3:
  type: inventory
  inventory: chest
  title: Frank's Catch
  gui: true
  debug: false
  size: 54
  procedural items:
    - determine <player.flag[fishbot.caught_items]>
  slots:
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
  - [] [] [] [] [] [] [] [] []
