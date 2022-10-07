safety_n_t_placer:
  type: world
  debug: false
  events:
    on player right clicks block with:safety_n_t_item:
      - determine passively cancelled
      - narrate <context.location.material.name>
      - if <context.location.material.name.if_null[air]> != air:
        - take iteminhand
        - spawn primed_tnt <context.location.center.above[.5]> save:safe_tnt
        - waituntil <entry[safe_tnt].spawned_entity.is_on_ground>
        - wait 1s
        - while <entry[safe_tnt].spawned_entity.is_spawned||false> && !<entry[safe_tnt].spawned_entity.location.find_entities[player|wolf|cat|parrot|allay].within[8].is_empty>:
          - adjust <entry[safe_tnt].spawned_entity> fuse_ticks:60
          - wait 1s
          - narrate Boomfailed
        - narrate KABOOM

safety_n_t_item:
  type: item
  debug: false
  material: tnt
  data:
    recipe_book_category: gadgets.safety_n_t
  display name: <&6>Safety_N_T
  lore:
  - <&e>Garuanteed<&6>* not to explode you or friends!
  - <&6>*Adriftus trading co not liable for loss of life or injury
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - clock|string|tnt
