custom_food_applejellytoast:
  type: item
  debug: false
  material: apple
  display name: <&a>Apple Jelly Toast
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 339
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_toast|custom_food_applejelly