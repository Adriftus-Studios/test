custom_food_capresesalad:
  type: item
  debug: false
  material: apple
  display name: <&a>Caprese Salad
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 468
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_food_cheese|custom_crop_tomato|custom_crop_spiceleaf