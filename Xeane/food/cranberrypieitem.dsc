custom_food_cranberrypie:
  type: item
  debug: false
  material: apple
  display name: <&a>Cranberry Pie
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>8 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 580
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_cranberry|sugar|custom_ingredient_doughitem