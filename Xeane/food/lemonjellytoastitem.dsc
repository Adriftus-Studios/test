custom_food_lemonjellytoast:
  type: item
  debug: false
  material: apple
  display name: <&a>Lemon Jelly Toast
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 832
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_lemonjelly|custom_food_toast