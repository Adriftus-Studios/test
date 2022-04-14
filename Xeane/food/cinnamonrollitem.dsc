custom_food_cinnamonroll:
  type: item
  debug: false
  material: apple
  display name: <&a>Cinnamon Roll
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>8<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 551
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_groundcinnamon|sugar|custom_ingredient_doughitem