custom_food_friedchicken:
  type: item
  debug: false
  material: apple
  display name: <&a>Fried Chicken
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>8<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 673
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_flouritem|chicken|custom_ingredient_cookingoilitem