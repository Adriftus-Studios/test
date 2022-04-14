custom_food_hotdog:
  type: item
  debug: false
  material: apple
  display name: <&a>Hot Dog
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>16 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 777
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_groundpork|bread|custom_ingredient_mayonaiseitem