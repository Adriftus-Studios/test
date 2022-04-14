custom_food_raspberrytrifle:
  type: item
  debug: false
  material: apple
  display name: <&a>Raspberry Trifle
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>13 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1094
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_raspberry|custom_ingredient_creamitem|custom_crop_vanillabean|custom_ingredient_doughitem