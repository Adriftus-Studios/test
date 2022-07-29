multitool:
  type: item
  material: clay_ball
  display name: Mighty Morphin Multi-Tool
  lore:
  - <&a>I have teh POWER!

multitool_events:
  type: world
  debug: false
  events:
    on player clicks block with:multitool:
      - choose <player.cursor_on.material.vanilla_tags.filter[advanced_matches[mineable*]].first.after[/]>:
        - case axe:
          - inventory adjust slot:<player.held_item_slot> material:netherite_axe
        - case pickaxe:
          - inventory adjust slot:<player.held_item_slot> material:netherite_pickaxe
        - case shovel:
          - inventory adjust slot:<player.held_item_slot> material:netherite_shovel
        - case hoe:
          - inventory adjust slot:<player.held_item_slot> material:netherite_hoe
        - default:
          - inventory adjust slot:<player.held_item_slot> material:clay_ball
          