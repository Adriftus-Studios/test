custom_food_caramelyogurt:
  type: item
  debug: false
  material: apple
  display name: <&a>Caramel Yogurt
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>7<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 472
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_yogurt|custom_food_caramel