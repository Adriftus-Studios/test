custom_food_sausagebeanmelt:
  type: item
  debug: false
  material: apple
  display name: <&a>Sausage Bean Melt
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>18 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1117
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_doughitem|custom_food_sausage|custom_crop_bean|custom_food_cheese