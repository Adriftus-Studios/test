custom_food_cucumbersandwich:
  type: item
  debug: false
  material: apple
  display name: <&a>Cucumber Sandwich
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 592
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|bread|custom_crop_cucumber|custom_food_cheese|custom_ingredient_creamitem