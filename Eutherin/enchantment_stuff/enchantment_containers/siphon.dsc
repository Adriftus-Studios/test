Siphon_enchantment:
  type: enchantment
  id: Siphon
  debug: false
  slots:
  - mainhand
  rarity: very_rare
  min_cost: <context.level.mul[1]>
  max_cost: <context.level.mul[1]>
  data:
    effect:
      - Blocks broken go to your inventory.
      - _
      - Prefers the same tool with Storage
    item_slots:
      - tools
  category: tools
  full_name: <&7>Siphon <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 3
  treasure_only: true
  is_tradable: false
  can_enchant: <context.item.advanced_matches[*_hoe|*_shovel|*_pickaxe|*_axe|shears]>
