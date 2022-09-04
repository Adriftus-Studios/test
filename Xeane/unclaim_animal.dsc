breeder_tool_use:
  type: task
  debug: false
  script:
      - determine passively cancelled
      - ratelimit <player> 1t
      - stop if:<context.entity.owner.exists.not>
      - stop if:<context.entity.owner.equals[<player>].not>
      - if <context.entity.has_flag[remove_owner]>:
        - adjust <context.entity> owner
        - narrate "<&a>You have given up ownership of this animal."
      - else:
        - flag <context.entity> remove_owner expire:10s
        - narrate "<&a>Click again to remove your ownership of this animal."

breeder_tool:
  type: item
  debug: false
  material: stick
  display name: <&a>Breeder Tool
  lore:
  - <&e>A Tool for Animal Handlers
  - <&a>Right Click an Animal
  mechanisms:
    custom_model_data: 1000
  flags:
    right_click_entity: breeder_tool_use
  data:
    recipe_book_category: tools.animal_tool
  recipes:
    1:
      type: shaped
      input:
      - air|iron_ingot|air
      - iron_ingot|iron_ingot|iron_ingot
      - air|stick|air