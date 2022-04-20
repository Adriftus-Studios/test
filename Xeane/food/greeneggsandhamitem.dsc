custom_food_greeneggsandham:
  type: item
  debug: false
  material: apple
  display name: <&a>Green Eggs and Ham
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>8<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 731
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|porkchop|custom_crop_avocado/custom_crop_banana|green_dye