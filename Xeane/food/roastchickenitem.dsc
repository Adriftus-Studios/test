custom_food_roastchicken:
  type: item
  debug: false
  material: apple
  display name: <&a>Roast Chicken
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>10 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1107
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|chicken|custom_ingredient_saltandpepperitem