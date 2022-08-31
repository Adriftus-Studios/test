skin_unlock_medium_chainmail:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Medium Chainmail Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 9
    color: <color[#0903FD]>
  data:
    recipe_book_category: gadgets.medium_chainmail
  flags:
    right_click_script: item_skin_unlock_armor
    id: medium_chainmail
    type: armor
  recipes:
    1:
      type: shaped
      input:
      - double_compressed_iron_ingot|double_compressed_iron_ingot|double_compressed_iron_ingot
      - double_compressed_iron_ingot|chest|double_compressed_iron_ingot
      - double_compressed_iron_ingot|double_compressed_iron_ingot|double_compressed_iron_ingot
