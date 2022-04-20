custom_food_pomegranatesmoothie:
  type: item
  debug: false
  material: apple
  display name: <&a>Pomegranate Smoothie
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1047
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_crop_pomegranate|blue_ice/ice/packed_ice/snowball