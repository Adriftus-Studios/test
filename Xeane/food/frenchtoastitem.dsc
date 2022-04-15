custom_food_frenchtoast:
  type: item
  debug: false
  material: apple
  display name: <&a>French Toast
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 671
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|bread|custom_crop_avocado/custom_crop_banana|custom_food_groundcinnamon|milk_bucket/custom_ingredient_freshmilkitem