custom_food_sweettea:
  type: item
  debug: false
  material: apple
  display name: <&a>Sweet Tea
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>8 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1202
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_hotteaitem|sugar|custom_crop_lemon|blue_ice/ice/packed_ice/snowball