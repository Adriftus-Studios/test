custom_food_orangeyogurt:
  type: item
  debug: false
  material: apple
  display name: <&a>Orange Yogurt
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>8 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 943
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_crop_orange|custom_food_yogurt