custom_food_cheeseontoast:
  type: item
  debug: false
  material: apple
  display name: <&a>Cheese on Toast
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 489
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_toast|custom_food_cheese