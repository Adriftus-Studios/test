Temporal_theft_enchantment:
  type: enchantment
  id: Temporal_Theft
  debug: false
  slots:
  - mainhand
  rarity: uncommon
  min_cost: <context.level.mul[1]>
  max_cost: <context.level.mul[2]>
  data:
    effect:
      - Steals a portion of the victim's speed for 2 seconds.
      - _
      - Levels increase the amount stolen by 10% per level.
    item_slots:
      - ranged
  category: bow
  full_name: <&7>Temporal Theft <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 3
  treasure_only: true
  is_curse: false
  is_tradable: false
  is_discoverable: true
  can_enchant: <context.item.advanced_matches[bow|crossbow]>
  after attack:
  - ratelimit <player> 12t
  - if <util.random.int[1].to[10]> < 7:
    - stop
  - if <player.has_flag[temp.custom_enchantment_tempo]> || <context.victim.has_flag[temp.custom_enchantment_tempo]> || !<context.victim.is_spawned>:
    - stop
  - flag <player> temp.custom_enchantment_tempo duration:40t
  - flag <context.victim> temp.custom_enchantment_tempo duration:40t
  - define player_speed <player.walk_speed>
  - define mob_speed <context.victim.speed>
  - adjust <context.victim> speed:<[mob_speed].sub[<context.victim.speed.div[10].mul[<context.level>]>]>
  - adjust <player> walk_speed:<[player_speed].add[<context.victim.speed.div[10].mul[<context.level>]>]>
  - wait 30t
  - adjust <player> walk_speed:<[player_speed]>
  - if <context.victim.is_spawned>:
    - adjust <context.victim> speed:<[mob_speed]>
