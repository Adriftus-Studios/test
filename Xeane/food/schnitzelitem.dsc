custom_food_schnitzel:
  type: item
  debug: false
  material: apple
  display name: <&a>Schnitzel
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>13<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1121
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|porkchop|custom_ingredient_flouritem|custom_crop_lemon|custom_ingredient_cookingoilitem|custom_ingredient_blackpepperitem