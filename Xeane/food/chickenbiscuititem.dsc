custom_food_chickenbiscuit:
  type: item
  debug: false
  material: apple
  display name: <&a>Chicken Biscuit
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>18<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 505
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_friedchicken|custom_food_biscuit