Soulbound_enchantment:
  type: enchantment
  id: Soulbound
  debug: true
  slots:
  - mainhand
  rarity: rare
  min_cost: <context.level.mul[2]>
  max_cost: <context.level.mul[3]>
  data:
    effect:
      - Prevents this item from dropping when you die.
      - §
      - Will lose one level each time it takes effect.
    item_slots:
      - anything
  category: wearable
  full_name: <&7>Soulbound <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 5
  treasure_only: true
  is_curse: false
  is_tradable: false
  is_discoverable: true
  can_enchant: <context.item.advanced_matches[*]>
  is_compatible: <context.enchantment_key.advanced_matches_text[denizen:soulbound].not>
