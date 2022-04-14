custom_food_waffles:
  type: item
  debug: false
  material: apple
  display name: <&a>Waffles
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1236
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_ingredient_cookingoilitem|custom_ingredient_batteritem|custom_ingredient_butteritem|custom_crop_avocado/custom_crop_banana