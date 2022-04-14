custom_food_bakedalaska:
  type: item
  debug: false
  material: apple
  display name: <&a>Baked Alaska
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>18 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 365
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_meringue|custom_ingredient_doughitem|sugar|custom_food_icecream/custom_food_chocolateicecream/custom_food_caramelicecream