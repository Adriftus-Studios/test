custom_food_potatoandcheesepirogi:
  type: item
  debug: false
  material: apple
  display name: <&a>Potato and Cheese Pirogi
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1055
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_ingredient_doughitem|potato|custom_food_cheese