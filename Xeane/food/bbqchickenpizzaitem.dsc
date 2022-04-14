custom_food_bbqchickenpizza:
  type: item
  debug: false
  material: apple
  display name: <&a>BBQ Chicken Pizza
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>13 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 389
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|chicken|custom_food_bbqsauce|custom_crop_onion|custom_food_cheese|custom_ingredient_doughitem