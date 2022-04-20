custom_food_donut:
  type: item
  debug: false
  material: apple
  display name: <&a>Donut
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 612
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_cookingoilitem|custom_ingredient_batteritem