custom_food_maplesyrupwaffles:
  type: item
  debug: false
  material: apple
  display name: <&a>Maple Syrup Waffles
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>16<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 870
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_ingredient_cookingoilitem|custom_ingredient_batteritem|custom_ingredient_butteritem|custom_crop_avocado/custom_crop_banana|custom_crop_maplesyrup