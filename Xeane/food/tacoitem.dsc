custom_food_taco:
  type: item
  debug: false
  material: apple
  display name: <&a>Taco
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>18 <&chr[0001].font[adriftus:foods]>
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|beef|custom_crop_lettuce|custom_food_cheese|custom_food_tortilla