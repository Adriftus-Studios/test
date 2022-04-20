custom_food_pumpkincheesecake:
  type: item
  debug: false
  material: apple
  display name: <&a>Pumpkin Cheese Cake
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1069
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|sugar|custom_food_cheese|pumpkin|custom_ingredient_batteritem