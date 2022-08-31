skin_unlock_royal_gold_item:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Royal Gold Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 23
    color: <color[#1703FD]>
  data:
    recipe_book_category: gadgets.royal_gold
  flags:
    right_click_script: item_skin_unlock_armor
    id: royal_gold
    type: armor
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_golden_block|triple_compressed_golden_block|triple_compressed_golden_block
      - triple_compressed_golden_block|royal_crest|triple_compressed_golden_block
      - triple_compressed_golden_block|triple_compressed_golden_block|triple_compressed_golden_block
