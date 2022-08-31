skin_unlock_light_netherite_item:
  type: item
  material: leather_helmet
  display name: <&b>COSMETIC<&co><&6> Light Netherite Set
  lore:
  - <&e>Right Click while holding
  - <&b>Apply at Spawn!
  mechanisms:
    custom_model_data: 32
    color: <color[#2103FD]>
  data:
    recipe_book_category: gadgets.light_netherite
  flags:
    right_click_script: item_skin_unlock_armor
    id: light_netherite
    type: armor
  recipes:
    1:
      type: shaped
      input:
      - compressed_netherite_ingot|compressed_netherite_ingot|compressed_netherite_ingot
      - compressed_netherite_ingot|chest|compressed_netherite_ingot
      - compressed_netherite_ingot|compressed_netherite_ingot|compressed_netherite_ingot
