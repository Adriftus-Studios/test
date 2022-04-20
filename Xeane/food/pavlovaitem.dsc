custom_food_pavlova:
  type: item
  debug: false
  material: apple
  display name: <&a>Pavlova
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>17<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 969
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_avocado/custom_crop_banana|sugar|custom_crop_lemon|custom_food_meringue|custom_crop_strawberry