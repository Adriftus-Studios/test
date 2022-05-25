custom_durability_process_task:
  type: task
  debug: false
  script:
      - if !<player.inventory.slot[<[slot]>].has_flag[custom_durability.max]>:
        - stop
      - if <player.inventory.slot[<[slot]>].flag[custom_durability.current].add[<[value]>]> < <player.inventory.slot[<[slot]>].flag[custom_durability.max]>:
        - inventory flag slot:<[slot]> custom_durability.current:<player.inventory.slot[<[slot]>].flag[custom_durability.current].add[<[value]>]>
        - if <player.inventory.slot[<[slot]>].material.max_durability> >= 0:
          - define percent <player.inventory.slot[<[slot]>].flag[custom_durability.current].div[<player.inventory.slot[<[slot]>].flag[custom_durability.max]>]>
          - define current_dur <player.inventory.slot[<[slot]>].material.max_durability.mul[<[percent]>]>
          - inventory adjust slot:<[slot]> durability:<[current_dur].round_up>
      - define durability_lore "<player.inventory.slot[<[slot]>].flag[custom_durability.current]>/<player.inventory.slot[<[slot]>].flag[custom_durability.max]>"
      - if <player.inventory.slot[<[slot]>].is_enchanted>:
        - inventory adjust slot:<[slot]> hides:ENCHANTS
        - if <player.inventory.slot[<[slot]>].material.name> == enchanted_book:
          - inventory adjust slot:<[slot]> hides:ITEM_DATA
        - define map <player.inventory.slot[<[slot]>].enchantment_map>
        - define enchant_lore:|:<player.inventory.slot[<[slot]>].enchantment_types.parse_tag[<[parse_value].full_name[<[map].get[<[parse_value].name>]>].replace_text[<&r>].with[]>]>
      - define item_lore <player.inventory.slot[<[slot]>].script.parsed_key[lore].if_null[<list[]>]>
      - define final_lore <[item_lore].include[<&nl><[enchant_lore].if_null[]>].include[<&nl>].include[<&f><[durability_lore]>]>
      - inventory adjust slot:<[slot]> lore:<[final_lore]>
      - else:
        - take slot:<[slot]>
        - playsound sound:item_shield_break <player>

