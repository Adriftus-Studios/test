custom_food_eggsalad:
  type: item
  debug: false
  material: apple
  display name: <&a>Egg Salad
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 633
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_crop_avocado/custom_crop_banana|custom_ingredient_mayonaiseitem|custom_crop_mustard|custom_crop_spiceleaf