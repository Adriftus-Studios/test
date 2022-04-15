custom_food_applefritter:
  type: item
  debug: false
  material: apple
  display name: <&a>Apple Fritter
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 337
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|apple|custom_ingredient_doughitem|sugar|custom_ingredient_cookingoilitem