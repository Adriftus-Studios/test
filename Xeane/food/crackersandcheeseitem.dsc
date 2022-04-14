custom_food_crackersandcheese:
  type: item
  debug: false
  material: apple
  display name: <&a>Crackers and Cheese
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 575
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_cheese|custom_food_cracker