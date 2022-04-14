custom_food_chikoroll:
  type: item
  debug: false
  material: apple
  display name: <&a>Chikoroll
  data:
    amount: 16
    saturation: 19
  lore:
  - <&e>Hunger: <&f>16<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>19<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 520
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_ingredient_cookingoilitem|custom_ingredient_doughitem|chicken|carrot|custom_crop_cabbage|custom_crop_leek|custom_crop_onion