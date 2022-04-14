custom_food_omelet:
  type: item
  debug: false
  material: apple
  display name: <&a>Omelet
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>8 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 931
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_crop_avocado/custom_crop_banana|custom_crop_bellpepper|custom_crop_onion