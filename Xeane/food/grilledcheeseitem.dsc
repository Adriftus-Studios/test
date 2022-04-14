custom_food_grilledcheese:
  type: item
  debug: false
  material: apple
  display name: <&a>Grilled Cheese
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>16 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 739
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|bread|custom_ingredient_butteritem|custom_food_cheese