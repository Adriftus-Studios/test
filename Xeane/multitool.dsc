multitool:
  type: item
  material: netherite_sword
  display name: Mighty Morphin Multi-Tool
  lore:
  - <&a>I have teh POWER!

multitool_events:
  type: world
  debug: false
  events:
    on player clicks block with:multitool permission:morphtool.morph:
      - choose <player.cursor_on.material.vanilla_tags.filter[advanced_matches[mineable*]].first.after[/]>:
        - case axe:
          - inventory adjust slot:<player.held_item_slot> material:netherite_axe
        - case pickaxe:
          - inventory adjust slot:<player.held_item_slot> material:netherite_pickaxe
        - case shovel:
          - stop if:<context.click.equals[RIGHT]>
          - inventory adjust slot:<player.held_item_slot> material:netherite_shovel
        - case hoe:
          - inventory adjust slot:<player.held_item_slot> material:netherite_hoe
        - default:
          - stop

    on player damages entity with:multitool permission:morphtool.morph:
          - inventory adjust slot:<player.held_item_slot> material:netherite_sword

