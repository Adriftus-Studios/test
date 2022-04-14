custom_food_maplesyruppancakes:
  type: item
  debug: false
  material: apple
  display name: <&a>Maple Syrup Pancakes
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 869
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_ingredient_cookingoilitem|custom_ingredient_batteritem|custom_ingredient_butteritem|custom_crop_maplesyrup