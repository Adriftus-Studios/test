custom_food_toastsandwich:
  type: item
  debug: false
  material: apple
  display name: <&a>Toast Sandwich
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>16<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1222
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_food_toast|custom_food_toast|custom_ingredient_blackpepperitem