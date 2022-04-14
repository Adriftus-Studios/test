custom_food_chocolatedonut:
  type: item
  debug: false
  material: apple
  display name: <&a>Chocolate Donut
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 535
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_cookingoilitem|custom_ingredient_batteritem|custom_ingredient_cocoapowderitem