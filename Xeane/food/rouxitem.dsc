custom_food_roux:
  type: item
  debug: false
  material: apple
  display name: <&a>Roux
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>7 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1112
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_ingredient_butteritem|custom_ingredient_flouritem