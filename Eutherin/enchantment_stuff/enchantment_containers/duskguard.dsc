Duskguard_enchantment:
  type: enchantment
  id: Duskguard
  debug: false
  slots:
  - mainhand
  rarity: uncommon
  min_cost: <context.level.mul[1]>
  max_cost: <context.level.mul[1]>
  data:
    effect:
      - Deals 3 damage/level during nighttime
      - _
      - Cannot be combined with Dawnguard
    item_slots:
      - sword
      - axe
  category: weapon
  full_name: <&7>Duskguard <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 3
  is_tradable: false
  can_enchant: <context.item.advanced_matches[*_sword|*_axe]>
  is_compatible: <context.enchantment_key.advanced_matches_text[denizen:Duskguard].not>
  after attack:
