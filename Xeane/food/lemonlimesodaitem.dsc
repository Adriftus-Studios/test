custom_food_lemonlimesoda:
  type: item
  debug: false
  material: apple
  display name: <&a>Lemon Lime Soda
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>7<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 165
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|water_bucket/custom_ingredient_freshwateritem|sugar|custom_crop_lemon|custom_crop_lime