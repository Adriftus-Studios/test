custom_food_tiropita:
  type: item
  debug: false
  material: apple
  display name: <&a>Tiropita
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1219
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_doughitem|custom_ingredient_cookingoilitem|custom_crop_avocado/custom_crop_banana|custom_food_cheese