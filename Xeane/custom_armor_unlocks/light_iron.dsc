skin_unlock_light_iron:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Light Iron Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 14
    color: <color[#0E03FD]>
  data:
    recipe_book_category: gadgets.light_iron
  flags:
    right_click_script: item_skin_unlock_armor
    id: light_iron
    type: armor
  recipes:
    1:
      type: shaped
      input:
      - compressed_iron_block|compressed_iron_block|compressed_iron_block
      - compressed_iron_block|chest|compressed_iron_block
      - compressed_iron_block|compressed_iron_block|compressed_iron_block
