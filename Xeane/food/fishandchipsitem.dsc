custom_food_fishandchips:
  type: item
  debug: false
  material: apple
  display name: <&a>Fish and Chips
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 660
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|cod/salmon/tropical_fish|custom_ingredient_flouritem|custom_food_fries