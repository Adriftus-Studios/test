custom_food_chocolatecaramelfudge:
  type: item
  debug: false
  material: apple
  display name: <&a>Chocolate Caramel Fudge
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>8<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 530
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_chocolatebar|custom_food_caramel