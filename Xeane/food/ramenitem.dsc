custom_food_ramen:
  type: item
  debug: false
  material: apple
  display name: <&a>Ramen
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1087
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_pastaitem|custom_food_stock|custom_ingredient_saltitem