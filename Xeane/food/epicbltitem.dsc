custom_food_epicblt:
  type: item
  debug: false
  material: apple
  display name: <&a>Epic BLT
  data:
    amount: 23
    saturation: 28
  lore:
  - <&e>Hunger: <&f>23<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>28<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 645
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_epicbacon|custom_crop_lettuce|custom_crop_tomato|bread