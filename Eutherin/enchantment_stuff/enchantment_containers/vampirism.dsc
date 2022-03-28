vampirism_enchantment:
  type: enchantment
  id: vampirism
  debug: false
  slots:
  - mainhand
  rarity: rare
  min_cost: <context.level.mul[2]>
  max_cost: <context.level.mul[3]>
  data:
    effect:
      - Heals you for 2 health when you kill a monster.
    item_slots:
      - sword
      - axe
  category: weapon
  full_name: <&7>Vampirism <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 3
  treasure_only: true
  is_curse: false
  is_tradable: false
  is_discoverable: true
  can_enchant: <context.item.advanced_matches[*_sword|*_axe]>