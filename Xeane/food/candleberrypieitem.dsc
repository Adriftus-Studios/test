custom_food_candleberrypie:
  type: item
  debug: false
  material: apple
  display name: <&a>Candleberry Pie
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>8 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 455
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_candleberry|sugar|custom_ingredient_doughitem