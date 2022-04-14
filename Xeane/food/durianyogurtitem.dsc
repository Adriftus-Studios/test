custom_food_durianyogurt:
  type: item
  debug: false
  material: apple
  display name: <&a>Durian Yogurt
  data:
    amount: 4
    saturation: 5
  lore:
  - <&e>Hunger: <&f>4 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>5 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 626
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_crop_durian|custom_food_yogurt