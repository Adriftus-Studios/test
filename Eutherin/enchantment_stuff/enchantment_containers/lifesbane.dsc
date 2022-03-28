Lifesbane_enchantment:
  type: enchantment
  id: lifesbane
  debug: false
  slots:
  - mainhand
  rarity: common
  min_cost: <context.level.mul[1]>
  max_cost: <context.level.mul[1]>
  data:
    effect:
      - Deals 2.5 damage per level to living humanoids.
      - _
      - Cannot be used with Bane of Arthropods, Slaying, Sharpness, or Smite.
    item_slots:
      - sword
      - axe
  category: weapon
  full_name: <&7>Lifesbane <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 3
  is_tradable: false
  can_enchant: <context.item.advanced_matches[*_sword|*_axe]>
  is_compatible: <context.enchantment_key.advanced_matches_text[minecraft:bane_of_arthropods|denizen:slaying|minecraft:sharpness|minecraft:smite].not>
  after attack:
    - if <context.victim.is_spawned> && <list[pillager|evoker|vindicator|player|villager|illusioner].contains_any[<context.victim.entity_type>]>:
      - hurt <context.victim> <context.level.mul[2.5]>