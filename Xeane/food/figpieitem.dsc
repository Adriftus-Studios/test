custom_food_figpie:
  type: item
  debug: false
  material: apple
  display name: <&a>Fig Pie
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 656
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_fig|sugar|custom_ingredient_doughitem