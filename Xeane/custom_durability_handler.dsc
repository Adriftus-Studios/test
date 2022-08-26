custom_durability_handler:
  type: world
  debug: false
  events:
    on player item_flagged:custom_durability.max takes damage:
      - define slot <context.slot>
      - inventory flag slot:<[slot]> custom_durability.current:++
      - define custom_percentage <context.item.flag[custom_durability.current].div[<context.item.flag[custom_durability.max]>]>
      - define vanilla_percentage <context.item.durability.div[<context.item.max_durability>]>
      - define lore <context.item.lore.if_null[<list>]>
      - define placement <[lore].find_match[<&7>Durability*]>
      - if <[placement]> != -1:
        - define new_lore "<[lore].overwrite[<&7>Durability<&co> <context.item.flag[custom_durability.current]>/<context.item.flag[custom_durability.max]>].at[<[placement]>]>"
      - else:
        - define new_lore "<[lore].include[<&7>Durability<&co> <context.item.flag[custom_durability.current]>/<context.item.flag[custom_durability.max]>]>"
      - inventory adjust slot:<[slot]> durability:<[custom_percentage].mul[<context.item.material.max_durability>]>
      - inventory adjust slot:<[slot]> lore:<[new_lore]>
      - if <[custom_percentage]> > <[vanilla_percentage]>:
        - determine cancelled