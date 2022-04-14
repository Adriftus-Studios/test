custom_food_pumpkinbread:
  type: item
  debug: false
  material: apple
  display name: <&a>Pumpkin Bread
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>8 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1068
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|pumpkin|custom_ingredient_doughitem