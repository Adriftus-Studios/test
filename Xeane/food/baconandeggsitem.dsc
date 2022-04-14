custom_food_baconandeggs:
  type: item
  debug: false
  material: apple
  display name: <&a>Bacon and Eggs
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>7 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 359
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_crop_avocado/custom_crop_banana|porkchop