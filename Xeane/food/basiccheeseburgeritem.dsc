custom_food_basiccheeseburger:
  type: item
  debug: false
  material: apple
  display name: <&a>Basic Cheeseburger
  data:
    amount: 17
    saturation: 20
  lore:
  - <&e>Hunger: <&f>17 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>20 <&chr[0001].font[adriftus:foods]>
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_groundbeef|custom_ingredient_mayonaiseitem|bread|custom_food_cheese