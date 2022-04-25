Sickening_enchantment:
  type: enchantment
  id: Sickening
  debug: false
  slots:
  - mainhand
  rarity: uncommon
  min_cost: <context.level.mul[1]>
  max_cost: <context.level.mul[1]>
  data:
    effect:
      - 10% Chance per level to cause nausea for 2s
    item_slots:
      - sword
      - axe
  category: weapon
  full_name: <&7>Sickening <context.level.to_roman_numerals>
  min_level: 1
  max_level: 3
  is_tradable: false
  can_enchant: <context.item.advanced_matches[*_sword|*_axe]>
#  is_compatible:
  after attack:
    - ratelimit <player> 12t
    - if <context.victim.is_spawned> && <util.random.int[1].to[10].add[<context.level>]> > 9:
      - cast CONFUSION amplifier:0 duration:5s
