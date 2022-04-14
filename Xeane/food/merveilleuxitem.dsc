custom_food_merveilleux:
  type: item
  debug: false
  material: apple
  display name: <&a>Merveilleux
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>16 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 890
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_meringue|custom_ingredient_creamitem|custom_food_chocolatebar