copper_hoe:
  type: item
  material: iron_hoe
  flags:
    custom_durability:
      max: 200
      current: 0
  data:
    recipe_book_category: tools.copper_hoe
  mechanisms:
    custom_model_data: 1
  display name: <&f>Copper Hoe
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - copper_ingot|copper_ingot|air
      - air|stick|air
      - air|stick|air
