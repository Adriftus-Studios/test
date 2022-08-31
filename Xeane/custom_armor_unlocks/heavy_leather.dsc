skin_unlock_heavy_leather:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Heavy Leather Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 3
    color: <color[#0303FD]>
  data:
    recipe_book_category: gadgets.heavy_leather
  flags:
    right_click_script: item_skin_unlock_armor
    id: heavy_leather
    type: armor
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_leather|triple_compressed_leather|triple_compressed_leather
      - triple_compressed_leather|chest|triple_compressed_leather
      - triple_compressed_leather|triple_compressed_leather|triple_compressed_leather
