custom_food_groiledcheesesandwich:
  type: item
  debug: false
  material: apple
  display name: <&a>Groiled Cheese Sandwich
  data:
    amount: 18
    saturation: 22
  lore:
  - <&e>Hunger: <&f>18<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>22<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 743
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_cheese|custom_food_vegemite|bread|custom_ingredient_cookingoilitem