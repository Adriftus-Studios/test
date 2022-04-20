custom_food_orangesoda:
  type: item
  debug: false
  material: apple
  display name: <&a>Orange Soda
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>10<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 166
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|water_bucket/custom_ingredient_freshwateritem|sugar|custom_crop_orange