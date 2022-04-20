custom_food_redvelvetcupcake:
  type: item
  debug: false
  material: apple
  display name: <&a>Red Velvet Cupcake
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>16<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1102
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_batteritem|sugar|custom_ingredient_creamitem|custom_ingredient_butteritem|red_dye