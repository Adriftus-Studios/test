custom_food_friedrice:
  type: item
  debug: false
  material: apple
  display name: <&a>Fried Rice
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 678
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_crop_rice|carrot|custom_crop_avocado/custom_crop_banana|custom_crop_onion|custom_crop_peas