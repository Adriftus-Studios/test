Steel_hoe:
  type: item
  material: iron_hoe
  flags:
    custom_durability:
      max: 200
      current: 0
  data:
    recipe_book_category: tools.Steel_hoe
  mechanisms:
    custom_model_data: 1
  display name: <&f>Steel Hoe
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - Steel_ingot|Steel_ingot|air
      - air|stick|air
      - air|stick|air

