custom_food_huckleberrypie:
  type: item
  debug: false
  material: apple
  display name: <&a>Huckleberry Pie
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>8<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 782
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_huckleberry|sugar|custom_ingredient_doughitem