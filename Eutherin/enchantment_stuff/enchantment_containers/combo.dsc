combo_enchantment:
  type: enchantment
  id: combo
  debug: true
  slots:
  - mainhand
  rarity: common
  min_cost: <context.level.mul[1]>
  max_cost: <context.level.mul[1]>
  data:
    effect:
      - Repeated attacks to a target do 2 damage per level per attack.
      - _
      - Stacks up to 2x your enchantment level.
    item_slots:
      - sword
      - axe
      - bows
      - crossbows
  category: weapon
  full_name: <&7>Combo <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 3
  is_tradable: false
  can_enchant: <context.item.advanced_matches[*_sword|*_axe|bow|crossbow]>
  after attack:
  - ratelimit <player> 12t
  - define victim <context.victim>
  - if !<player.has_flag[custom_enchant_combo]> || <context.victim> != <player.flag[combo_target].if_null[rip]>:
    - flag <player> custom_enchant_combo:1 expire:5s
    - flag <player> combo_target:<context.victim> expire:5s
    - stop
  - flag <player> custom_enchant_combo:++ expire:50s
  - flag <player> combo_target:<context.victim> expire:50s
  - hurt <player.flag[custom_enchant_combo]> <[victim]> cause:void
  - if <player.has_flag[custom_enchant_combo]> && <player.flag[custom_enchant_combo]> <= <context.level.mul[2]>:
    - flag <player> custom_enchant_combo:<player.flag[custom_enchant_combo]> expire:5s
    - flag <player> combo_target:<context.victim> expire:50s

    - narrate <player.flag[custom_enchant_combo]>
