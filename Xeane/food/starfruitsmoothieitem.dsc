custom_food_starfruitsmoothie:
  type: item
  debug: false
  material: apple
  display name: <&a>Starfruit Smoothie
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>13 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1158
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_crop_starfruit|blue_ice/ice/packed_ice/snowball