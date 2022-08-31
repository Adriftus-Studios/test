skin_unlock_heavy_chainmail:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Heavy Chainmail Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 10
    color: <color[#0A03FD]>
  data:
    recipe_book_category: gadgets.heavy_chainmail
  flags:
    right_click_script: item_skin_unlock_armor
    id: heavy_chainmail
    type: armor
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_iron_ingot|triple_compressed_iron_ingot|triple_compressed_iron_ingot
      - triple_compressed_iron_ingot|chest|triple_compressed_iron_ingot
      - triple_compressed_iron_ingot|triple_compressed_iron_ingot|triple_compressed_iron_ingot
