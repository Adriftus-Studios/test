custom_food_holidaycake:
  type: item
  debug: false
  material: apple
  display name: <&a>Holiday Cake
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 766
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_avocado/custom_crop_banana|sugar|custom_crop_cherry|custom_ingredient_creamitem|custom_crop_spiceleaf