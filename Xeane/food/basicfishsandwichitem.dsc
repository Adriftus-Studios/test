custom_food_basicfishsandwich:
  type: item
  debug: false
  material: apple
  display name: <&a>Basic Fish Sandwich
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 384
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_groundfish|custom_ingredient_mayonaiseitem|bread