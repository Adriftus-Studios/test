spikes_enchantment:
  type: enchantment
  id: spikes
  debug: false
  slots:
  - mainhand
  rarity: common
  min_cost: <context.level.mul[1]>
  max_cost: <context.level.mul[1]>
  data:
    effect:
      - Returns 1 damage per level to the attacker.
      - _
      - Only effective during blocking. 2s CD
    item_slots:
      - Shield
  category: shield
  full_name: <&7>spikes <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 5
  is_tradable: false
  can_enchant: <context.item.advanced_matches[*_shield]>
#  is_compatible:
  after attack: