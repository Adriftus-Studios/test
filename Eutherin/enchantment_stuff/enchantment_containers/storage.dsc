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
      - <&empty>
      - Pairs well with Siphon
    item_slots:
      - tools
  category: breakable
  full_name: <&7>storage <context.level.to_roman_numerals>
  min_level: 1
  max_level: 3
  treasure_only: true
  is_tradable: false
  can_enchant: <context.item.advanced_matches[*_hoe|*_shovel|*_pickaxe|*_axe|shears]>
