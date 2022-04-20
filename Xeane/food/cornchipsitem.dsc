custom_food_cornchips:
  type: item
  debug: false
  material: apple
  display name: <&a>Corn Chips
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>7<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 563
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_corn|custom_ingredient_saltitem|custom_ingredient_cookingoilitem