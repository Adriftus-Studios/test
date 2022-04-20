custom_food_fishtaco:
  type: item
  debug: false
  material: apple
  display name: <&a>Fish Taco
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>17<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 667
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|cod/salmon/tropical_fish|custom_crop_lettuce|custom_food_cheese|custom_food_tortilla