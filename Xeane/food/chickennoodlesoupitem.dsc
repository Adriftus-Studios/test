custom_food_chickennoodlesoup:
  type: item
  debug: false
  material: apple
  display name: <&a>Chicken Noodle Soup
  data:
    amount: 15
    saturation: 18
  lore:
  - <&e>Hunger: <&f>15 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>18 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 514
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|chicken|carrot|custom_ingredient_pastaitem|custom_food_stock