custom_food_glowberrysmoothie:
  type: item
  debug: false
  material: apple
  display name: <&a>Glow Berry Smoothie
  data:
    amount: 5
    saturation: 6
  lore:
  - <&e>Hunger: <&f>5<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>6<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 700
  recipes:
    1:
      type: shapeless
      input: cooking_tool_mixingbowl|custom_food_glowberryjuice|blue_ice/ice/packed_ice/snowball