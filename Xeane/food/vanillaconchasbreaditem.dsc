custom_food_vanillaconchasbread:
  type: item
  debug: false
  material: apple
  display name: <&a>Vanilla Conchas Bread
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1228
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_doughitem|sugar|custom_crop_avocado/custom_crop_banana|custom_ingredient_vanillaitem