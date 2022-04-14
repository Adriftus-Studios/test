custom_food_cinnamontoast:
  type: item
  debug: false
  material: apple
  display name: <&a>Cinnamon Toast
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 553
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|bread|custom_food_groundcinnamon|sugar|custom_ingredient_butteritem