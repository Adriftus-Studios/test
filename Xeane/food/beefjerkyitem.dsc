custom_food_beefjerky:
  type: item
  debug: false
  material: apple
  display name: <&a>Beef Jerky
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>7 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 396
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|beef|custom_ingredient_saltitem