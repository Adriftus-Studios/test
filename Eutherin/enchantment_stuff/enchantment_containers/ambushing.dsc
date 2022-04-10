ambushing_enchantment:
  type: enchantment
  id: ambushing
  debug: false
  slots:
  - mainhand
  rarity: common
  min_cost: <context.level.mul[1]>
  max_cost: <context.level.mul[1]>
  data:
    effect:
      - Attacks on mobs that are not actively targeting you deal 2 more damage per level
    item_slots:
      - sword
      - axe
  category: weapon
  full_name: <&7>Ambushing <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 3
  treasure_only: true
  is_tradable: false
  can_enchant: <context.item.advanced_matches[*_sword|*_axe]>
  after attack:
    - ratelimit <player> 12t
    - if <context.victim.target||null> != <player> && <context.victim.is_spawned>:
      - hurt <context.victim> <context.level.mul[2]>
