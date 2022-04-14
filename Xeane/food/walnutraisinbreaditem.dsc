custom_food_walnutraisinbread:
  type: item
  debug: false
  material: apple
  display name: <&a>Walnut Raisin Bread
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1237
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_walnut|custom_food_raisins|custom_ingredient_doughitem|custom_food_groundcinnamon