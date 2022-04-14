custom_food_sweetberryyogurt:
  type: item
  debug: false
  material: apple
  display name: <&a>Sweet Berry Yogurt
  data:
    amount: 5
    saturation: 6
  lore:
  - <&e>Hunger: <&f>5 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>6 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1198
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_yogurt|sweet_berries