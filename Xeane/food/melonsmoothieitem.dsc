custom_food_melonsmoothie:
  type: item
  debug: false
  material: apple
  display name: <&a>Melon Smoothie
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>8<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 886
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_food_melonjuice|blue_ice/ice/packed_ice/snowball