custom_food_macncheese:
  type: item
  debug: false
  material: apple
  display name: <&a>Mac n Cheese
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 856
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_pastaitem|custom_food_cheese