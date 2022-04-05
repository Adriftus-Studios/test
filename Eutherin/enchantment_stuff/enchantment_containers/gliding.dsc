Gliding_enchantment:
  type: enchantment
  id: Gliding
  debug: false
  slots:
  - mainhand
  rarity: very_rare
  min_cost: <context.level.mul[1]>
  max_cost: <context.level.mul[1]>
  data:
    effect:
      - Slows your fall. Consumes 6/4/2 durability per second
    item_slots:
      - boots
  category: armor
  full_name: <&7>Gliding <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 3
  is_tradable: false
  can_enchant: <context.item.advanced_matches[*_boots]>
#  is_compatible:
  after attack:
