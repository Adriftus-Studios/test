custom_food_limeyogurt:
  type: item
  debug: false
  material: apple
  display name: <&a>Lime Yogurt
  data:
    amount: 4
    saturation: 5
  lore:
  - <&e>Hunger: <&f>4<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>5<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 844
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_crop_lime|custom_food_yogurt