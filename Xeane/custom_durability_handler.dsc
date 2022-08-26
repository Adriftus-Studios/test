custom_durability_handler:
  type: world
  debug: false
  events:
    on player item_flagged:custom_durability.max takes damage:
      - inventory flag slot:<context.slot> custom_duratbility.current:--
      - define custom_percentage <context.item.flag[custom_durability.current].div[<context.item.flag[custom_durability.max]>]>
      - define vanilla_percentage <context.item.durability.div[<context.item.max_durability>]>
      - define lore <context.item.lore.if_null[<list>]>
      - define placement <[lore].find_match[<&7>Durability*]>
      - if <[placement]> != -1:
        - define new_lore "<[lore].overwrite[<&7>Durability<&co> <context.item.flag[custom_durability.current]>/<context.item.flag[custom_durability.max]>].at[<[placement]>]>"
      - else:
        - define new_lore "<[lore].include[<&7>Durability<&co> <context.item.flag[custom_durability.current]>/<context.item.flag[custom_durability.max]>]>"
      - if <[custom_percentage]> > <[vanilla_percentage]>:
        - determine cancelled