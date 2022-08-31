skin_unlock_pirate_iron:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Pirate Iron Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 19
    color: <color[#1303FD]>
  data:
    recipe_book_category: gadgets.pirate_iron
  flags:
    right_click_script: item_skin_unlock_armor
    id: pirate_iron
    type: armor
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_iron_block|triple_compressed_iron_block|triple_compressed_iron_block
      - triple_compressed_iron_block|pirate_eye_patch|triple_compressed_iron_block
      - triple_compressed_iron_block|triple_compressed_iron_block|triple_compressed_iron_block
