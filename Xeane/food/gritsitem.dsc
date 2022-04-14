custom_food_grits:
  type: item
  debug: false
  material: apple
  display name: <&a>Grits
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 742
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_food_cornmeal|milk_bucket/custom_ingredient_freshmilkitem|water_bucket/custom_ingredient_freshwateritem|custom_ingredient_saltitem