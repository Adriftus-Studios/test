custom_food_hushpuppies:
  type: item
  debug: false
  material: apple
  display name: <&a>Hush Puppies
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>10 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 786
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_food_cornmeal|custom_crop_avocado/custom_crop_banana|custom_crop_onion