custom_food_fishsticks:
  type: item
  debug: false
  material: apple
  display name: <&a>Fish Sticks
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>7<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 666
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_groundfish|custom_ingredient_flouritem