custom_food_quesadilla:
  type: item
  debug: false
  material: apple
  display name: <&a>Quesadilla
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>11<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1076
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_tortilla|custom_food_cheese