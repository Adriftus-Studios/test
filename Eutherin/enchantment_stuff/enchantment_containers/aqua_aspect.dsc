Aqua_Aspect_enchantment:
  type: enchantment
  id: Aqua_Aspect
  debug: false
  slots:
  - mainhand
  rarity: common
  min_cost: <context.level.mul[1]>
  max_cost: <context.level.mul[1]>
  data:
    effect:
      - Deals 2.5 damage per level to water fearers.
      - _
      - Cannot be used with Banes, Slaying, Sharpness, or Smite.
    item_slots:
      - sword
      - axe
  category: weapon
  full_name: <&7>Aqua Aspect <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 3
  is_tradable: false
  can_enchant: <context.item.advanced_matches[*_sword|*_axe]>
  is_compatible: <context.enchantment_key.advanced_matches_text[minecraft:bane_of_arthropods|denizen:slaying|minecraft:sharpness|minecraft:smite|denizen:lifesbane].not>
  after attack: