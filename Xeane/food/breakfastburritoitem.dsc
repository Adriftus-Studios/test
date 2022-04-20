custom_food_breakfastburrito:
  type: item
  debug: false
  material: apple
  display name: <&a>Breakfast Burrito
  data:
    amount: 20
    saturation: 24
  lore:
  - <&e>Hunger: <&f>20<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>24<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 431
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_tortilla|custom_food_scrambledegg|porkchop|potato|custom_food_cheese