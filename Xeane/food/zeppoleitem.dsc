custom_food_zeppole:
  type: item
  debug: false
  material: apple
  display name: <&a>Zeppole
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>10 <&chr[0001].font[adriftus:foods]>
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_cookingoilitem|custom_ingredient_doughitem|custom_food_groundcinnamon