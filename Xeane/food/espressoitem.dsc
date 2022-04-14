custom_food_espresso:
  type: item
  debug: false
  material: apple
  display name: <&a>Expresso
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>13 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 646
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_hotcoffeeitem|custom_ingredient_hotcoffeeitem|custom_ingredient_hotcoffeeitem|sugar