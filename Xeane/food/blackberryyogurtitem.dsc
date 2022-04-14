custom_food_blackberryyogurt:
  type: item
  debug: false
  material: apple
  display name: <&a>Blackberry Yogurt
  data:
    amount: 5
    saturation: 6
  lore:
  - <&e>Hunger: <&f>5<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>6<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 411
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_crop_blackberry|custom_food_yogurt