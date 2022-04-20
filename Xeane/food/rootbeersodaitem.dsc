custom_food_rootbeersoda:
  type: item
  debug: false
  material: apple
  display name: <&a>Rootbeer Soda
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>7<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 167
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|water_bucket/custom_ingredient_freshwateritem|sugar|custom_food_edibleroot