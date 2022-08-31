skin_unlock_light_chainmail:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Light Chainmail Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 8
    color: <color[#0803FD]>
  data:
    recipe_book_category: gadgets.light_chainmail
  flags:
    right_click_script: item_skin_unlock_armor
    id: light_chainmail
    type: armor
  recipes:
    1:
      type: shaped
      input:
      - compressed_iron_ingot|compressed_iron_ingot|compressed_iron_ingot
      - compressed_iron_ingot|chest|compressed_iron_ingot
      - compressed_iron_ingot|compressed_iron_ingot|compressed_iron_ingot
