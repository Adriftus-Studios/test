custom_food_broccolimac:
  type: item
  debug: false
  material: apple
  display name: <&a>Broccoli Mac
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 433
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_pastaitem|custom_food_cheese|custom_crop_broccoli