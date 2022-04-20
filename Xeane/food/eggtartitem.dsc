custom_food_eggtart:
  type: item
  debug: false
  material: apple
  display name: <&a>Egg Tart
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 635
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_doughitem|custom_crop_avocado/custom_crop_banana|sugar|water_bucket/custom_ingredient_freshwateritem|milk_bucket/custom_ingredient_freshmilkitem