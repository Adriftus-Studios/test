custom_food_p8juice:
  type: item
  debug: false
  material: apple
  display name: <&a>P8 Juice
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>8 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 946
  recipes:
    1:
      type: shapeless
      input: cooking_tool_juicer|custom_crop_avocado/custom_crop_olive|custom_crop_avocado/custom_crop_olive