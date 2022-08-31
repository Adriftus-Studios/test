skin_unlock_heavy_iron:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Heavy Iron Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 16
    color: <color[#1003FD]>
  data:
    recipe_book_category: gadgets.heavy_iron
  flags:
    right_click_script: item_skin_unlock_armor
    id: heavy_iron
    type: armor
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_iron_block|triple_compressed_iron_block|triple_compressed_iron_block
      - triple_compressed_iron_block|chest|triple_compressed_iron_block
      - triple_compressed_iron_block|triple_compressed_iron_block|triple_compressed_iron_block
