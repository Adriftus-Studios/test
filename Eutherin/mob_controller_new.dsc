test_mob_buttons:
  type: world
  definitions: value
  level:
    - flag player debug.level:<[level]>
    - narrate "Level set to <[level]>"
  entity:
    - flag player debug.entity:<[entity].to_uppercase>1
    - narrate "Entity set to <[entity].to_uppercase>1"
  test_equipment:
    37: boots/test_boots
    38: leggings/test_pants
    39: chestplate/test_shirt
    40: helmet/test_helmet
  events:
    on player clicks mangrove_button location_flagged:level:
      - if <context.location.above.material.name> == warped_wall_sign:
        - define level <context.location.above.sign_contents.first>
        - flag player debug.level:<[level]>
        - narrate "Level set to <[level]>"
        - stop
      - else if <context.location.above[2].material.name> == warped_wall_sign:
        - define level <context.location.above[2].sign_contents.last>
        - flag player debug.level:<[level]>
        - narrate "Level set to <[level]>"
        - stop
    on player clicks mangrove_button location_flagged:entity:
        - repeat 4 as:i:
          - if <context.location.below[<[i]>].material.name> == warped_wall_sign:
            - define entity <context.location.below[<[i]>].sign_contents.get[<element[5].sub[<[i]>]>]>
            - flag player debug.entity:<[entity]>
            - narrate "Entity set to <[entity]>"
            - stop
    on player clicks warped_sign location_flagged:entity:
      - if <player.flag[debug.entity_location]> != <context.location>:
        - flag <player> debug.entity_increment:0
      - define entity <context.location.sign_contents.get[<player.flag[debug.entity_increment].add[1]>]>
      - flag player debug.entity:<[entity]>
      - flag player debug.entity_increment:<player.flag[debug.entity_increment].add[1].if_null[0]>
      - narrate "Entity set to <[entity]>"
      - stop
    on player clicks mangrove_button location_flagged:spawn:
      - define location <location[-32,118,-2251,<player.world.name>]>
      - narrate "Spawning a <player.flag[debug.entity]> on the gold platform"
      - mythicspawn <[location]> <player.flag[debug.entity]>

    on player clicks mangrove_button location_flagged:equip:
      - foreach <list[37|38|39|40]> as:slot:
        - if <player.inventory.slot[<[slot]>].material.name> == air:
          - equip <script[test_mob_buttons].data_key[test_equipment.<[slot]>].before[/]>:<script[test_mob_buttons].data_key[test_equipment.<[slot]>].after[/]>
        - else:
          - inventory adjust slot:<[slot]> durability:0
      - give test_sword
      - give test_axe
      - give golden_apple quantity:10

    on player clicks mangrove_button location_flagged:heal:
      - heal
      - feed

test_sword:
  type: item
  material: netherite_sword
  display name: <&b>Test Sword
  enchantments:
  - unbreaking:3
  - sharpness:5
  - sweeping:2
  - fire_aspect:2
  unbreakable: true

test_axe:
  type: item
  material: netherite_axe
  display name: <&b>Test Axe
  enchantments:
  - unbreaking:3
  - bane:5
  - smite:5
  - sweeping:2
  - fire_aspect:2
  unbreakable: true

test_helmet:
  type: item
  material: netherite_helmet
  display name: <&b>Test Helmet
  enchantments:
  - protection:4
  - unbreaking:3

test_boots:
  type: item
  material: netherite_boots
  display name: <&b>Test Boots
  enchantments:
  - protection:4
  - unbreaking:3

test_pants:
  type: item
  material: netherite_leggings
  display name: <&b>Test Pants
  enchantments:
  - protection:4
  - unbreaking:3

test_shirt:
  type: item
  material: netherite_chestplate
  display name: <&b>Test shirt
  enchantments:
  - protection:4
  - unbreaking:3
