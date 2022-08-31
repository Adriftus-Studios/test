skin_unlock_heavy_gold_item:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Heavy Gold Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 22
    color: <color[#1603FD]>
  data:
    recipe_book_category: gadgets.heavy_gold
  flags:
    right_click_script: item_skin_unlock_armor
    id: heavy_gold
    type: armor
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_golden_block|triple_compressed_golden_block|triple_compressed_golden_block
      - triple_compressed_golden_block|chest|triple_compressed_golden_block
      - triple_compressed_golden_block|triple_compressed_golden_block|triple_compressed_golden_block
