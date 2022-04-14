custom_food_frosteddonut:
  type: item
  debug: false
  material: apple
  display name: <&a>Frosted Donut
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>16 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 680
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_cookingoilitem|custom_ingredient_batteritem|sugar|custom_ingredient_butteritem|milk_bucket/custom_ingredient_freshmilkitem