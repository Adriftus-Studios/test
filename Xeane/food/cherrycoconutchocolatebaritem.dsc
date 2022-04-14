custom_food_cherrycoconutchocolatebar:
  type: item
  debug: false
  material: apple
  display name: <&a>Cherry Coconut Chocolate Bar
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 493
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_food_chocolatebar|custom_crop_cherry|custom_crop_coconut