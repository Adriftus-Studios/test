custom_food_noodlesoup:
  type: item
  debug: false
  material: apple
  display name: <&a>Noodle Soup
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>12<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 922
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_pastaitem|custom_food_stock