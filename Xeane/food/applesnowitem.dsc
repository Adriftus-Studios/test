custom_food_applesnow:
  type: item
  debug: false
  material: apple
  display name: <&a>Apple Snow
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>18<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 343
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_meringue|custom_ingredient_butteritem|apple