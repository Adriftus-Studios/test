custom_food_baconcheeseburger:
  type: item
  debug: false
  material: apple
  display name: <&a>Bacon Cheeseburger
  data:
    amount: 25
    saturation: 30
  lore:
  - <&e>Hunger: <&f>25 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>30 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 360
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_groundbeef|custom_ingredient_mayonaiseitem|bread|porkchop|custom_food_cheese