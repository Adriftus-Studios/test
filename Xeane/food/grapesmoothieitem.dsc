custom_food_grapesmoothie:
  type: item
  debug: false
  material: apple
  display name: <&a>Grape Smoothie
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>8 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 727
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_crop_grape|blue_ice/ice/packed_ice/snowball