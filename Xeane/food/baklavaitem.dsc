custom_food_baklava:
  type: item
  debug: false
  material: apple
  display name: <&a>Baklava
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>13 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 370
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_doughitem|custom_crop_walnut|custom_food_groundcinnamon|custom_ingredient_butteritem|sugar