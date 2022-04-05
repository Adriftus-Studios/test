seeding_enchantment:
  type: enchantment
  id: seeding
  debug: false
  slots:
  - mainhand
  rarity: uncommon
  min_cost: <context.level.mul[1]>
  max_cost: <context.level.mul[1]>
  data:
    effect:
      - 10% chance per level to replant grown crops when broken.
    item_slots:
      - hoe
  category: tool
  full_name: <&7>Seeding <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 5
  treasure_only: true
  is_tradable: false
  can_enchant: <context.item.advanced_matches[*_hoe]>
