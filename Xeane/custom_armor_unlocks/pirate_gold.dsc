skin_unlock_pirate_gold:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Pirate Gold Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 25
    color: <color[#1903FD]>
  data:
    recipe_book_category: gadgets.pirate_gold
  flags:
    right_click_script: item_skin_unlock_armor
    id: pirate_gold
    type: armor
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_golden_block|triple_compressed_golden_block|triple_compressed_golden_block
      - triple_compressed_golden_block|pirate_eye_patch|triple_compressed_golden_block
      - triple_compressed_golden_block|triple_compressed_golden_block|triple_compressed_golden_block
