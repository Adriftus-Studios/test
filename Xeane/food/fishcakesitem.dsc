custom_food_fishcakes:
  type: item
  debug: false
  material: apple
  display name: <&a>Fish Cakes
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 661
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_groundfish|custom_crop_avocado/custom_crop_banana|custom_food_toast|custom_crop_scallion