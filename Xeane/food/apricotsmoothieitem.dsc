custom_food_apricotsmoothie:
  type: item
  debug: false
  material: apple
  display name: <&a>Apricot Smoothie
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>13 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 351
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_crop_apricot|blue_ice/ice/packed_ice/snowball