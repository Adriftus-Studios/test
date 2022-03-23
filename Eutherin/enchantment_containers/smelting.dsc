smelting_enchantment:
  type: enchantment
  id: smelting
  slots:
  - mainhand
  rarity: uncommon
  min_cost: <context.level.mul[1]>
  max_cost: <context.level.mul[3]>
  data:
    effect:
      - Can cause ore to drop ingots instead of raw ore
      - _
      - 15% chance per level. Incompatible with Fortune/Silk Touch.
    item_slots:
      - pickaxe
  category: digger
  full_name: <&7>Smelting <context.level.proc[arabic_to_roman]>
  min_level: 1
  max_level: 3
  is_tradable: false
  can_enchant: <context.item.advanced_matches[*_pickaxe]>
  is_compatible: <context.enchantment_key.advanced_matches_text[minecraft:fortune].not>
  treasure_only: true

smelting_enchant_handler:
  type: world
  debug: false
  events:
    on player breaks *iron_ore|*copper_ore|*gold_ore|iron_ore|copper_ore|gold_ore with:item_enchanted:smelting:
      - if <util.random.int[1].to[10].add[<player.item_in_hand.enchantment_map.get[smelting].mul[1.5]>]> > 10:
        - define material <context.location.material.name.after[deepslate_].if_null[<context.location.material.name>].before[_ore]>
        - determine <[material]>_ingot
