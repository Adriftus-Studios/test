custom_food_chocolatechippancakes:
  type: item
  debug: false
  material: apple
  display name: <&a>Chocolate Chip Pancakes
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 532
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_chocolatebar|custom_ingredient_cookingoilitem|custom_ingredient_batteritem|custom_ingredient_butteritem