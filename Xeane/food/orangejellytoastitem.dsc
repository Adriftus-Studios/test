custom_food_orangejellytoast:
  type: item
  debug: false
  material: apple
  display name: <&a>Orange Jelly Toast
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 939
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_orangejelly|custom_food_toast