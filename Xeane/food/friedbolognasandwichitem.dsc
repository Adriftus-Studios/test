custom_food_friedbolognasandwich:
  type: item
  debug: false
  material: apple
  display name: <&a>Fried Bologna Sandwich
  data:
    amount: 23
    saturation: 28
  lore:
  - <&e>Hunger: <&f>23 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>28 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 672
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|bread|custom_food_bologna|custom_food_cheese