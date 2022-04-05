storage_enchantment:
  type: enchantment
  id: storage
  debug: false
  slots:
  - mainhand
  rarity: very_rare
  min_cost: <context.level.mul[1]>
  max_cost: <context.level.mul[1]>
  data:
    effect:
      - These items contain an extra inventory.
      - _
      - Pairs well with Siphon
    item_slots:
      - tools
  category: tools
  full_name: <&7>storage <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 3
  treasure_only: true
  is_tradable: false
  can_enchant: <context.item.advanced_matches[*_hoe|*_shovel|*_pickaxe|*_axe|shears]>
