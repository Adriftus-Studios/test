custom_food_taiyaki:
  type: item
  debug: false
  material: apple
  display name: <&a>Taiyaki
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1205
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_ingredient_doughitem|custom_food_misopaste|sugar