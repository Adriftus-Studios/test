custom_durability_handler:
  type: world
  debug: true
  events:
    on player item_flagged:custom_durability.max takes damage:
      - define slot <context.slot>
      - define custom_durability <context.item.flag[custom_durability.current].add[<context.damage>]>
      - define custom_percentage <[custom_durability].div[<context.item.flag[custom_durability.max]>]>
      - define vanilla_percentage <context.item.durability.add[1].div[<context.item.max_durability>]>
      - define lore <context.item.lore.if_null[<list>]>
      - define placement <[lore].find_match[<&7>Durability*]>
      - if <[placement]> != -1:
        - define new_lore "<[lore].overwrite[<&7>Durability<&co> <context.item.flag[custom_durability.max].sub[<[custom_durability]>]>/<context.item.flag[custom_durability.max]>].at[<[placement]>]>"
      - else:
        - define new_lore "<[lore].include[<&7>Durability<&co> <context.item.flag[custom_durability.max].sub[<[custom_durability]>]>/<context.item.flag[custom_durability.max]>]>"
      - if <[custom_percentage]> >= 1:
        - stop
      - else if <[custom_percentage]> < <[vanilla_percentage]>:
        - determine passively cancelled
      - else:
        - inventory adjust slot:<[slot]> durability:<[custom_percentage].mul[<context.item.material.max_durability>]>
      - inventory adjust slot:<[slot]> lore:<[new_lore]>
      - inventory flag slot:<[slot]> custom_durability.current:+:<context.damage>