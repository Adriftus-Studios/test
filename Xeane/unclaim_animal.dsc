unclaim_animal_use:
  type: task
  debug: false
  script:
      - stop if:<context.entity.owner.exists.not>
      - stop if:<context.entity.owner.equals[<player>].not>
      - determine passively cancelled
      - if <context.entity.has_flag[remove_owner]>:
        - adjust <context.entity> owner
        - narrate "<&a>You have given up ownership of this animal."
      - else:
        - flag <context.entity> remove_owner expire:10s
        - narrate "<&a>Sneak Punch again to remove your ownership of this animal."

unclaim_animal_stick:
  type: item
  debug: false
  material: stick
  display name: <&a>Taming Tool
  lore:
  - <&e>A Tool for Animal Handlers
  - <&a>Right Click an Animal
  mechanisms:
    custom_model_data: 1000
  flags:
    right_click_entity: unclaim_animal_use