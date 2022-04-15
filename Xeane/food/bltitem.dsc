custom_food_blt:
  type: item
  debug: false
  material: apple
  display name: <&a>BLT
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>18<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 412
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|porkchop|custom_crop_lettuce|custom_crop_tomato|bread