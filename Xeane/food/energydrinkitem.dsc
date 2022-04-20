custom_food_energydrink:
  type: item
  debug: false
  material: apple
  display name: <&a>Energy Drink
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>7<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 643
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|water_bucket/custom_ingredient_freshwateritem|sugar|redstone