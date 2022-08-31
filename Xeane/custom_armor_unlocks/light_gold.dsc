skin_unlock_light_gold:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Light Gold Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 20
    color: <color[#1403FD]>
  data:
    recipe_book_category: gadgets.light_gold
  flags:
    right_click_script: item_skin_unlock_armor
    id: light_gold
    type: armor
  recipes:
    1:
      type: shaped
      input:
      - compressed_golden_block|compressed_golden_block|compressed_golden_block
      - compressed_golden_block|chest|compressed_golden_block
      - compressed_golden_block|compressed_golden_block|compressed_golden_block
